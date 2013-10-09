From: Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v2 25/29] arc: use common of_flat_dt_match_machine
Date: Wed, 9 Oct 2013 12:04:52 -0500
Message-ID: <CAL_JsqJS8Vwt2363BXP+3zVNAHM-H=JPKEMkaq22wuQJBCZUXw@mail.gmail.com>
References: <1381163377-21044-1-git-send-email-robherring2@gmail.com>
	<1381163377-21044-26-git-send-email-robherring2@gmail.com>
	<52539B4C.9040400@synopsys.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <52539B4C.9040400-HKixBCOQz3hWk0Htik3J/w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Vineet Gupta <Vineet.Gupta1-HKixBCOQz3hWk0Htik3J/w@public.gmane.org>
Cc: lkml <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Tue, Oct 8, 2013 at 12:42 AM, Vineet Gupta
<Vineet.Gupta1-HKixBCOQz3hWk0Htik3J/w@public.gmane.org> wrote:
> Hi Rob,
>
> On 10/07/2013 09:59 PM, Rob Herring wrote:
>> From: Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ-XMD5yJDbdMReXY1tMh2IBg@public.gmane.org>
>>
>> Convert arc to use the common of_flat_dt_match_machine function.
>>
>> Signed-off-by: Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ-XMD5yJDbdMReXY1tMh2IBg@public.gmane.org>
>> Acked-by: Vineet Gupta <vgupta-HKixBCOQz3hWk0Htik3J/w@public.gmane.org>

>
> Can you please fold the following into this patch. This removes the const warning
> and also gets rid of some dead code.

Thanks. I've added this in and updated my branch. Please double check
it when you have a chance. I also made __arch_info_begin[] and
__arch_info_end[] const.

Rob
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
