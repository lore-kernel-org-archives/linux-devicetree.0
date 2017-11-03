From: Viresh Kumar <viresh.kumar-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH V2] of: platform: Create dummy routines for
 !CONFIG_OF_ADDRESS
Date: Fri, 3 Nov 2017 09:13:49 +0530
Message-ID: <20171103034349.GE4240@vireshk-i7>
References: <2d798213e4fefc074a66ccb7ab2fc243ee2b1e1a.1509186356.git.viresh.kumar@linaro.org>
 <20171101211458.wo4at67k7sxo5fah@rob-hp-laptop>
 <20171102044823.GV4240@vireshk-i7>
 <CAL_JsqK2GKF-SBhJTceY5j7=J40AH0oPxx4AHzmtw+Wrceeyuw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <CAL_JsqK2GKF-SBhJTceY5j7=J40AH0oPxx4AHzmtw+Wrceeyuw-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Vincent Guittot <vincent.guittot-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On 02-11-17, 07:40, Rob Herring wrote:
> No. As an example, ideally of_device_alloc would be an internal
> function. But we have one user in ibmebus.

Okay. Lets abandon this change then.

-- 
viresh
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
