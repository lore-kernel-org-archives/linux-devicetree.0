From: Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [RFC/PATCH] of: platform: Remove unique device name enforcement
Date: Sun, 18 May 2014 18:11:07 -0500
Message-ID: <CAL_JsqJKDFJDsGbhB-=W=ujgoRpnJGcJ9a74uhHjj4KFvRK=gg@mail.gmail.com>
References: <1400432516-6802-1-git-send-email-ezequiel@vanguardiasur.com.ar>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1400432516-6802-1-git-send-email-ezequiel-30ULvvUtt6G51wMPkGsGjgyUoB5FGQPZ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Ezequiel Garcia <ezequiel-30ULvvUtt6G51wMPkGsGjgyUoB5FGQPZ@public.gmane.org>
Cc: "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, =?UTF-8?Q?Guido_Mart=C3=ADnez?= <guido-30ULvvUtt6G51wMPkGsGjgyUoB5FGQPZ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Sun, May 18, 2014 at 12:01 PM, Ezequiel Garcia
<ezequiel-30ULvvUtt6G51wMPkGsGjgyUoB5FGQPZ@public.gmane.org> wrote:
> When creating a device object for a devicetree node, the device name
> is created by using the node name and the 'reg' property, to make a name
> such as "a000.foo_device".
>
> For certain devices without an associated address, and hence no 'reg' property,
> the current code attempts to make a unique name, by using a global integer.
> Names look like "foo_device.1", "bar_device.2", and so on.
> Examples of such devices are: gpio-keys', backlights and rotary-encoders.
>
> The system cannot know such devices name before hand, given they are determined
> by the kernel probe order and by the nodes present in the devicetree. This can
> be problematic, on systems that are tied to the device's name, e.g. when
> catching hotplug events.
>
> In order to fix the name, this commit removes the global integer uniqueness
> enforcement and instead uses the node name for the device name. The rationale
> behind such change, is that there's no way two nodes with the same node name
> are associated to two different devices, by the nature of the devicetree.
> In other words, it's impossible to produce a name collision for these kind
> of devices.

This is perfectly legal:

/bus1/device
/bus2/device

Only the full name has to be unique.

>
> Signed-off-by: Ezequiel Garcia <ezequiel-30ULvvUtt6G51wMPkGsGjgyUoB5FGQPZ@public.gmane.org>
> ---
> Hello Grant, Rob:
>
> I'm pretty sure there's a good reason for the existence of the atomic magic
> integer, so this is not a *real* patch, but rather a bold attempt at asking you
> some explanations for this.
>
> Under what circumstances does the magic integer avoids a name collision?
> Will this propposal introduce a regression?

See the recent changes to this function in linux-next and the
associated discussion of those commits.

Rob
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
