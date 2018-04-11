Return-Path: <SRS0=7/vk=HA=vger.kernel.org=devicetree-owner@kernel.org>
Received: from mail-vk0-f41.google.com ([209.85.213.41]:39101 "EHLO
        mail-vk0-f41.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750785AbeDKEme (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Wed, 11 Apr 2018 00:42:34 -0400
Received: by mail-vk0-f41.google.com with SMTP id n124so306156vkd.6
        for <devicetree@vger.kernel.org>; Tue, 10 Apr 2018 21:42:33 -0700 (PDT)
Received: from mail-ua0-f169.google.com (mail-ua0-f169.google.com. [209.85.217.169])
        by smtp.gmail.com with ESMTPSA id 7sm152718uap.0.2018.04.10.21.42.32
        for <devicetree@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 10 Apr 2018 21:42:32 -0700 (PDT)
Received: by mail-ua0-f169.google.com with SMTP id n20so323473ual.7
        for <devicetree@vger.kernel.org>; Tue, 10 Apr 2018 21:42:32 -0700 (PDT)
MIME-Version: 1.0
References: <1523375324-27856-1-git-send-email-andy.yeh@intel.com>
 <1523375324-27856-3-git-send-email-andy.yeh@intel.com> <CAAFQd5ApQdHCFAmA1PjUOcDGa6VMbc=JJA1mLa8WH2PJJGD17g@mail.gmail.com>
In-Reply-To: <CAAFQd5ApQdHCFAmA1PjUOcDGa6VMbc=JJA1mLa8WH2PJJGD17g@mail.gmail.com>
From: Tomasz Figa <tfiga@chromium.org>
Date: Wed, 11 Apr 2018 04:42:21 +0000
Message-ID: <CAAFQd5DmQaNOpYiyg9WR+LVAWiMQ3o8e6V3ShVwhknUg51U61A@mail.gmail.com>
Subject: Re: [RESEND PATCH v7 2/2] media: dw9807: Add dw9807 vcm driver
Content-Type: text/plain; charset="UTF-8"
Sender: devicetree-owner@vger.kernel.org
To: "Yeh, Andy" <andy.yeh@intel.com>
Cc: Linux Media Mailing List <linux-media@vger.kernel.org>, Sakari Ailus <sakari.ailus@linux.intel.com>, devicetree@vger.kernel.org, jacopo@jmondi.org, Alan Chiang <alanx.chiang@intel.com>
List-ID: <devicetree@vger.kernel.org>

On Wed, Apr 11, 2018 at 1:38 PM Tomasz Figa <tfiga@chromium.org> wrote:
[snip]
> > +static int dw9807_set_dac(struct i2c_client *client, u16 data)
> > +{
> > +       const char tx_data[3] = {
> > +               DW9807_MSB_ADDR, ((data >> 8) & 0x03), (data & 0xff)
> > +       };
> > +       int ret, retry = 0;
> > +
> > +       /*
> > +        * According to the datasheet, need to check the bus status
> before we
> > +        * write VCM position. This ensure that we really write the
value
> > +        * into the register
> > +        */
> > +       while ((ret = dw9807_i2c_check(client)) != 0) {
> > +               if (ret < 0)
> > +                       return ret;
> > +
> > +               if (MAX_RETRY == ++retry) {
> > +                       dev_err(&client->dev,
> > +                               "Cannot do the write operation because
> VCM is busy\n");
> > +                       return -EIO;
> > +               }
> > +               usleep_range(DW9807_CTRL_DELAY_US, DW9807_CTRL_DELAY_US
+
> 10);
> > +       }

> One could use readx_poll_timeout() here:

> int val;

> ret = readx_poll_timeout(dw9807_i2c_check, client, val, !val,

Actually, to handle errors, it should be

ret = readx_poll_timeout(dw9807_i2c_check, client, val, val <= 0,

>                            DW9807_CTRL_DELAY_US,
>                            MAX_RETRY * DW9807_CTRL_DELAY_US);

> if (ret) {

if (ret || val < 0) {

>           dev_err(&client->dev,
>                   "Cannot do the write operation because VCM is busy\n");
>           return -EIO;

return ret ? ret : val;

Sorry for not spotting this earlier.

Best regards,
Tomasz
