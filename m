From: Chanwoo Choi <cwchoi00-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] extcon: arizona: Update naming for second jack detection
 DT binding
Date: Fri, 20 Nov 2015 23:51:30 +0900
Message-ID: <CAGTfZH1ystG0JAu-V6k+UdNfTQPBeSc+gK45UDbQAPAOt-HaCg@mail.gmail.com>
References: <1448009639-5331-1-git-send-email-ckeepax@opensource.wolfsonmicro.com>
	<20151120143925.GA11632@rob-hp-laptop>
Reply-To: cw00.choi-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20151120143925.GA11632@rob-hp-laptop>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Charles Keepax <ckeepax-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org>, "myungjoo.ham-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org" <myungjoo.ham-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-kernel <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, patches-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi Rob,

On Fri, Nov 20, 2015 at 11:39 PM, Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org> wrote:
> On Fri, Nov 20, 2015 at 08:53:59AM +0000, Charles Keepax wrote:
>> Update the name for the second jack detection pin binding to be a little
>> less confusing.
>
> This breaks compatibility with old dtbs. Either the driver needs to
> support both names or you just have to live with the old name.

This property has not been yet in all dtbs on Linux 4.4-rc1.

[snip]

Thanks,
Chanwoo Choi
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
