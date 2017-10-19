From: Frank Rowand <frowand.list@gmail.com>
Subject: Re: [PATCH v3 06/12] of: overlay: detect cases where device tree may
 become corrupt
Date: Thu, 19 Oct 2017 12:19:41 -0700
Message-ID: <59E8FACD.7030208@gmail.com>
References: <1508283392-18252-1-git-send-email-frowand.list@gmail.com>
 <1508283392-18252-7-git-send-email-frowand.list@gmail.com>
 <CANk1AXR_=yKyHmTj282o89irF-2FhsmCt-dV30Z9HkeNcVVizg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CANk1AXR_=yKyHmTj282o89irF-2FhsmCt-dV30Z9HkeNcVVizg@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Alan Tull <atull@kernel.org>
Cc: Rob Herring <robh+dt@kernel.org>, Pantelis Antoniou <pantelis.antoniou@konsulko.com>, David Airlie <airlied@linux.ie>, Jyri Sarha <jsarha@ti.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, linux-kernel <linux-kernel@vger.kernel.org>, Mark Rutland <mark.rutland@arm.com>, Tomi Valkeinen <tomi.valkeinen@ti.com>, dri-devel@lists.freedesktop.org
List-Id: devicetree@vger.kernel.org

On 10/19/17 12:04, Alan Tull wrote:
> On Tue, Oct 17, 2017 at 6:36 PM,  <frowand.list@gmail.com> wrote:
> 
>>  static int overlay_notify(struct overlay_changeset *ovcs,
>>                 enum of_overlay_notify_action action)
>>  {
>> @@ -86,8 +109,14 @@ static int overlay_notify(struct overlay_changeset *ovcs,
>>
>>                 ret = blocking_notifier_call_chain(&overlay_notify_chain,
>>                                                    action, &nd);
>> -               if (ret)
>> -                       return notifier_to_errno(ret);
>> +               if (ret == NOTIFY_STOP)
>> +                       return 0;
>> +               if (ret) {
>> +                       ret = notifier_to_errno(ret);
>> +                       pr_err("overlay changeset %s notifier error %d, target: %pOF\n",
>> +                              of_overlay_action_name[action], ret, nd.target);
>> +                       return ret;
>> +
> 
> Hi Frank,
> 
> This will spew lots of "error 0" messages for every notifier that
> returns NOTIFY_OK.
> 
> rmdir /sys/kernel/config/device-tree/overlays/1
> [  131.972505] OF: overlay: overlay changeset pre-remove notifier
> error 0, target: /soc/base_fpga_region/fpga_pr_region0
> [  131.987879] OF: overlay: overlay changeset post-remove notifier
> error 0, target: /soc/base_fpga_region/fpga_pr_region0

Thanks for finding that.  I'll send a patch so that NOTIFY_OK does
not spew an error.  (And overlay_notify() should also not be
returning an error in that case.)

-Frank


> 
> I could change fpga-region.c to return NOTIFY_STOP if it is accepting
> the overlay, but it will still want to return NOTIFY_OK for every case
> where it doesn't have an opinion.
> 
> Alan
> 
>>         }
>>
>>         return 0;
> 
