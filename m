From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v4 0/4] checkpatch: enhance compatible string checking
Date: Sat, 8 Mar 2014 14:59:51 -0600
Message-ID: <CAL_JsqLp_v_BVSMa6DZ8oiV2HkTBeASYk+aa=heAcwE4CQcY7Q@mail.gmail.com>
References: <1394235527-8999-1-git-send-email-florian.vaussard@epfl.ch>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1394235527-8999-1-git-send-email-florian.vaussard-p8DiymsW2f8@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Florian Vaussard <florian.vaussard-p8DiymsW2f8@public.gmane.org>
Cc: Andy Whitcroft <apw-Z7WLFzj8eWMS+FvcfC7Uqw@public.gmane.org>, Joe Perches <joe-6d6DIl74uiNBDgjK7y7TUQ@public.gmane.org>, Andrew Morton <akpm-de/tnXTf+JLsfHDXvbKv3WD2FQJk+8+b@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Fri, Mar 7, 2014 at 5:38 PM, Florian Vaussard
<florian.vaussard-p8DiymsW2f8@public.gmane.org> wrote:
> Hi,
>
> This series proposes a number of fixes and enhancements to the checks
> performed on compatible strings:
>
> 1) Fix vendor check for strings with dashes
> 2) Fix spurious vendor warning, when there is no vendor
> 3) Check for compatible strings in .c and .h files too
> 4) Match only at the begining of each line in vendor-prefixes.txt

For the series:

Acked-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>

I haven't had a chance to test, but will try to do so this week.

Rob
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
