From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH] extcon: arizona: Update naming for second jack detection
 DT binding
Date: Fri, 20 Nov 2015 10:00:55 -0600
Message-ID: <CAL_JsqKN0fj97Zxw=xQx9kioA-cHomWRQ=8ohXNk_+1WGz+Zaw@mail.gmail.com>
References: <1448009639-5331-1-git-send-email-ckeepax@opensource.wolfsonmicro.com>
 <20151120143925.GA11632@rob-hp-laptop> <1448031358.3536.39.camel@rf-debian.wolfsonmicro.main>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1448031358.3536.39.camel-WeElTRBN8n0bEPBeyYQi64iQ8/zYDDdY1BehtkLrGTY@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Richard Fitzgerald <rf-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org>, Charles Keepax <ckeepax-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org>
Cc: Chanwoo Choi <cw00.choi-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, myungjoo.ham-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, patches-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Fri, Nov 20, 2015 at 8:55 AM, Richard Fitzgerald
<rf-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org> wrote:
> On Fri, 2015-11-20 at 08:39 -0600, Rob Herring wrote:
>> On Fri, Nov 20, 2015 at 08:53:59AM +0000, Charles Keepax wrote:
>> > Update the name for the second jack detection pin binding to be a little
>> > less confusing.
>>
>> This breaks compatibility with old dtbs. Either the driver needs to
>> support both names or you just have to live with the old name.
>>
>
> This is a new DT option, it's never gone into a release kernel so there
> can't be any dtbs using it.

I see the thread now. The commit message should make that clear.

Acked-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
