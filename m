From: Vineet Gupta <Vineet.Gupta1-HKixBCOQz3hWk0Htik3J/w@public.gmane.org>
Subject: Re: [PATCH v2 25/29] arc: use common of_flat_dt_match_machine
Date: Thu, 10 Oct 2013 05:04:13 +0000
Message-ID: <C2D7FE5348E1B147BCA15975FBA23075150EC9@IN01WEMBXA.internal.synopsys.com>
References: <1381163377-21044-1-git-send-email-robherring2@gmail.com>
	<1381163377-21044-26-git-send-email-robherring2@gmail.com>
	<52539B4C.9040400@synopsys.com>
 <CAL_JsqJS8Vwt2363BXP+3zVNAHM-H=JPKEMkaq22wuQJBCZUXw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 8BIT
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Language: en-US
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: lkml <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On 10/09/2013 10:35 PM, Rob Herring wrote:
> Thanks. I've added this in and updated my branch. Please double check
> it when you have a chance. I also made __arch_info_begin[] and
> __arch_info_end[] const.

Works great !

Thx,
-Vineet
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
