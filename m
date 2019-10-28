Return-Path: <SRS0=uucL=YV=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.2 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	UNPARSEABLE_RELAY,URIBL_BLOCKED,USER_AGENT_SANE_2 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 76B12CA9EAF
	for <linux-devicetree@archiver.kernel.org>; Mon, 28 Oct 2019 02:36:33 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 4E45220B7C
	for <linux-devicetree@archiver.kernel.org>; Mon, 28 Oct 2019 02:36:33 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730132AbfJ1Cgc (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Sun, 27 Oct 2019 22:36:32 -0400
Received: from mailgw02.mediatek.com ([210.61.82.184]:8915 "EHLO
        mailgw02.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S1728627AbfJ1Cgc (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Sun, 27 Oct 2019 22:36:32 -0400
X-UUID: a24691263f054c6b98e1aa9f0bc40de7-20191028
X-UUID: a24691263f054c6b98e1aa9f0bc40de7-20191028
Received: from mtkcas09.mediatek.inc [(172.21.101.178)] by mailgw02.mediatek.com
        (envelope-from <bibby.hsieh@mediatek.com>)
        (Cellopoint E-mail Firewall v4.1.10 Build 0809 with TLS)
        with ESMTP id 2019778623; Mon, 28 Oct 2019 10:36:21 +0800
Received: from mtkcas08.mediatek.inc (172.21.101.126) by
 mtkmbs07n1.mediatek.inc (172.21.101.16) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Mon, 28 Oct 2019 10:36:18 +0800
Received: from [172.21.77.4] (172.21.77.4) by mtkcas08.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1395.4 via Frontend
 Transport; Mon, 28 Oct 2019 10:36:19 +0800
Message-ID: <1572230179.9186.2.camel@mtksdaap41>
Subject: Re: [PATCH v2] dt-binding: eeprom: at24: add supply properties
From:   Bibby Hsieh <bibby.hsieh@mediatek.com>
To:     Bartosz Golaszewski <bgolaszewski@baylibre.com>
CC:     Rob Herring <robh@kernel.org>, Tomasz Figa <tfiga@chromium.org>,
        "Wolfram Sang" <wsa@the-dreams.de>,
        linux-i2c <linux-i2c@vger.kernel.org>,
        "Nicolas Boichat" <drinkcat@chromium.org>,
        srv_heupstream <srv_heupstream@mediatek.com>,
        Mark Rutland <mark.rutland@arm.com>,
        linux-devicetree <devicetree@vger.kernel.org>
Date:   Mon, 28 Oct 2019 10:36:19 +0800
In-Reply-To: <CAMpxmJUygTr2b+q-skb8_m9TfOiEvqoOCSjDQEi+sf9iNN0=BQ@mail.gmail.com>
References: <20191018082557.3696-1-bibby.hsieh@mediatek.com>
         <20191018082557.3696-2-bibby.hsieh@mediatek.com>
         <CAMpxmJW_HQnL8i5FnKcVUs=ZyrnaFe6X+oqG38-v=O05d5vNxw@mail.gmail.com>
         <CAAFQd5CA_53uDo6QdRcvqJ5shUG5K25f+WXCn9OYMHfSgwLMSA@mail.gmail.com>
         <CAMpxmJWzEER4iBo9-WhmumuH1nmWYvy=xud+=7wzp3op8-P7uw@mail.gmail.com>
         <CAAFQd5DNdmm4sn1JNPhnuMor50ZP4EJmymtS4hB4WkNHmKOs6w@mail.gmail.com>
         <20191025211000.GA8235@bogus>
         <CAMpxmJUygTr2b+q-skb8_m9TfOiEvqoOCSjDQEi+sf9iNN0=BQ@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MTK:  N
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Sat, 2019-10-26 at 14:05 +0200, Bartosz Golaszewski wrote:
> pt., 25 paź 2019 o 23:10 Rob Herring <robh@kernel.org> napisał(a):
> >
> > On Thu, Oct 24, 2019 at 06:32:38PM +0900, Tomasz Figa wrote:
> > > On Thu, Oct 24, 2019 at 5:40 PM Bartosz Golaszewski
> > > <bgolaszewski@baylibre.com> wrote:
> > > >
> > > > czw., 24 paź 2019 o 09:02 Tomasz Figa <tfiga@chromium.org> napisał(a):
> > > > >
> > > > > On Thu, Oct 24, 2019 at 3:22 PM Bartosz Golaszewski
> > > > > <bgolaszewski@baylibre.com> wrote:
> > > > > >
> > > > > > pt., 18 paź 2019 o 10:26 Bibby Hsieh <bibby.hsieh@mediatek.com> napisał(a):
> > > > > > >
> > > > > > > In some platforms, they disable the power-supply of eeprom and i2c due
> > > > > > > to power consumption reduction.
> > > > > > >
> > > > > > > This patch add two supply properties: vcc-supply, i2c-supply.
> > > > > > >
> > > > > > > Changes since v1:
> > > > > > >  - change supply name
> > > > > > >  - rebase to next
> > > > > > >
> > > > > > > Signed-off-by: Bibby Hsieh <bibby.hsieh@mediatek.com>
> > > > > > > ---
> > > > > > >  Documentation/devicetree/bindings/eeprom/at24.yaml | 8 ++++++++
> > > > > > >  1 file changed, 8 insertions(+)
> > > > > > >
> > > > > > > diff --git a/Documentation/devicetree/bindings/eeprom/at24.yaml b/Documentation/devicetree/bindings/eeprom/at24.yaml
> > > > > > > index e8778560d966..578487a5d9b7 100644
> > > > > > > --- a/Documentation/devicetree/bindings/eeprom/at24.yaml
> > > > > > > +++ b/Documentation/devicetree/bindings/eeprom/at24.yaml
> > > > > > > @@ -167,6 +167,14 @@ properties:
> > > > > > >      minimum: 1
> > > > > > >      maximum: 8
> > > > > > >
> > > > > > > +  vcc-supply:
> > > > > > > +    description:
> > > > > > > +      phandle of the regulator that provides the supply voltage.
> > > > > > > +
> > > > > > > +  i2c-sypply:
> > > > > > > +    description:
> > > > > > > +      phandle to the regulator that provides power to i2c.
> > > > > > > +
> > > > > >
> > > > > > Something was bothering me about this patch so I came back to take a
> > > > > > look. Can you explain what i2c actually stands for in this doc? I hope
> > > > > > I'm misinterpreting something and it isn't that the driver disables
> > > > > > the regulator powering the i2c bus controller?
> > > > >
> > > > > In our case it's the regulator that the I2C bus is pulled up to.
> > > > >
> > > >
> > > > Then it has nothing to do with a generic EEPROM driver IMO. I think
> > > > you need to add the control for this regulator to your i2c controller
> > > > driver and create a power domain where the EEPROM would be lower in
> > > > hierarchy.
> > >
> > > While I agree that the generic EEPROM driver may not be the best place
> > > to do it, neither is a driver for a specific SoC i2c controller. The
> > > hardware design is not specific to any particular i2c controller.
> > >
> > > Perhaps we need the generic i2c core to take into account an
> > > i2c-supply? Wolfram, any thoughts on this?
> >
> > Sounds good to me. Maybe 'bus-supply' instead to indicate it's supposed
> > to be for the bus and not other things. It should reside in the I2C
> > controller's node (or mux ports) though.
> >
> > Rob
> 
> Thanks,
> 
> in that case Bibby: please just use a single regulator for vcc-supply in at24.

To my understanding, there are something I need to do.
1. remove i2c-supply property from DT.
2. just control vcc-supply in at24 driver.
3. add i2c-supply control in i2c and i2c-supply property in DT?

Is there any mistakes?

Bibby

> 
> Thanks,
> Bartosz


