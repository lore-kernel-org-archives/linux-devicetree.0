From: Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v2 2/4] remoteproc: dt: Provide bindings for ST's Remote
 Processor Controller driver
Date: Tue, 1 Sep 2015 06:49:45 -0500
Message-ID: <CAL_JsqKJjs4-tewODq2R-vUT=Nr494emLvDA_GEC5xt=HJ3WoQ@mail.gmail.com>
References: <1440757911-9120-1-git-send-email-lee.jones@linaro.org>
 <1440757911-9120-3-git-send-email-lee.jones@linaro.org> <CAL_JsqLuF2iAJhzjDh5CL-RgYk+H+N+D05wsWqUT01zvq9SOxA@mail.gmail.com>
 <20150901104145.GS4796@x1>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20150901104145.GS4796@x1>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Ohad Ben-Cohen <ohad-Ix1uc/W3ht7QT0dZR+AlfA@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, kernel-F5mvAk5X5gdBDgjK7y7TUQ@public.gmane.org, Nathan Lynch <Nathan_Lynch-nmGgyN9QBj3QT0dZR+AlfA@public.gmane.org>, Ludovic Barre <ludovic.barre-qxv4g6HH51o@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Tue, Sep 1, 2015 at 5:41 AM, Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org> wrote:
> On Mon, 31 Aug 2015, Rob Herring wrote:
>
>> On Fri, Aug 28, 2015 at 5:31 AM, Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org> wrote:
>> > Signed-off-by: Ludovic Barre <ludovic.barre-qxv4g6HH51o@public.gmane.org>
>> > Signed-off-by: Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
>> > ---
>> >  .../devicetree/bindings/remoteproc/st-rproc.txt    | 35 ++++++++++++++++++++++
>> >  1 file changed, 35 insertions(+)
>> >  create mode 100644 Documentation/devicetree/bindings/remoteproc/st-rproc.txt
>> >
>> > diff --git a/Documentation/devicetree/bindings/remoteproc/st-rproc.txt b/Documentation/devicetree/bindings/remoteproc/st-rproc.txt
>> > new file mode 100644
>> > index 0000000..fbd7d78
>> > --- /dev/null
>> > +++ b/Documentation/devicetree/bindings/remoteproc/st-rproc.txt
>> > @@ -0,0 +1,35 @@
>> > +STMicroelectronics Remote Processor
>>
>> "remote processor" is what STM datasheets call them? This seems like
>> Linux naming is leaking in here.
>
> That's what this directory is called and the other binding within it.

That doesn't make it right or answer my question. Certainly our
directory structure too closely mirrors the kernel.

Rob
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
