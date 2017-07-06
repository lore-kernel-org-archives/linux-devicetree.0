From: Sergei Shtylyov <sergei.shtylyov-M4DtvfQ/ZS1MRgGoP+s0PdBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH v6] media: platform: Renesas IMR driver
Date: Thu, 6 Jul 2017 21:16:35 +0300
Message-ID: <45854c21-f355-37e4-b677-dddb8222e719@cogentembedded.com>
References: <20170623203456.503714406@cogentembedded.com>
 <589c2ca4-d1e7-86c3-1ef5-8831a54856ed@xs4all.nl>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <589c2ca4-d1e7-86c3-1ef5-8831a54856ed-qWit8jRvyhVmR6Xm/wNWPw@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Hans Verkuil <hverkuil-qWit8jRvyhVmR6Xm/wNWPw@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Mauro Carvalho Chehab <mchehab-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-media-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: linux-renesas-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Konstantin Kozhevnikov <Konstantin.Kozhevnikov-M4DtvfQ/ZS1MRgGoP+s0PdBPR1lH4CV8@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hello!

On 07/03/2017 03:43 PM, Hans Verkuil wrote:

>> Index: media_tree/Documentation/media/v4l-drivers/rcar_imr.rst
>> ===================================================================
>> --- /dev/null
>> +++ media_tree/Documentation/media/v4l-drivers/rcar_imr.rst
>> @@ -0,0 +1,86 @@
>> +Renesas R-Car Image Rendeder (IMR) Driver
>
> Rendeder -> Renderer

    Oops, sorry. :-)

>> +=========================================
>> +
>> +This file documents some driver-specific aspects of the IMR driver, such as
>> +driver-specific ioctls.
>> +
>> +The ioctl reference
>> +~~~~~~~~~~~~~~~~~~~
>> +
>> +VIDIOC_IMR_MESH - Set mapping data
>> +^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
>> +
>> +Argument: struct imr_map_desc
>> +
>> +**Description**:
>> +
>> +    This ioctl sets up the mesh using which the input frames will be
>
> s/using/through/
>
>> +    transformed into the output frames. The mesh can be strictly rectangular
>> +    (when IMR_MAP_MESH bit is set in imr_map_desc::type) or arbitrary (when
>> +    that bit is not set).
>> +
>> +    A rectangular mesh consists of the imr_mesh structure followed by M*N
>> +    vertex objects (where M is imr_mesh::rows and N is imr_mesh::columns).
>> +    In case either IMR_MAP_AUTOSG or IMR_MAP_AUTODG bits were set in
>> +    imr_map_desc::type, imr_mesh::{x|y}0 specify the coordinates of the top
>> +    left corner of the auto-generated mesh and imr_mesh::d{x|y} specify the
>> +    mesh's X/Y steps.
>
> What if any of the other types are used like IMR_MAP_LUCE?

    IMR_MAP_LUCE only affects the vertex object.

> Is this documented in a Renesas datasheet?

    Yes.

> If so, add a reference to that in this
> documentation.

    Unfortunately it's not publicly available.

>> +
>> +    An arbitrary mesh consists of the imr_vbo structure followed by N
>> +    triangle objects (where N is imr_vbo::num), consisting of 3 vertex
>> +    objects each.
>> +
>> +    A vertex object has a complex structure:
>> +
>> +.. code-block:: none
>> +
>> +    __u16    v        vertical   \ source coordinates (only present
>> +    __u16    u        horizontal / if IMR_MAP_AUTOSG isn't set)
>> +    __u16    Y        vertical   \ destination coordinates (only here
>> +    __u16    X        horizontal / if IMR_MAP_AUTODG isn't set)
>> +    __s8    lofst        offset \  luminance correction parameters
>> +    __u8    lscal        scale   > (only present if IMR_MAP_LUCE
>> +    __u16    reserved           /  is set)
>> +    __s8    vrofs        V value offset \  hue correction parameters
>> +    __u8    vrscl        V value scale   \ (only present if IMR_MAP_CLCE
>> +    __s8    ubofs        U value offset  / is set)
>> +    __u8    ubscl        U value scale  /
>
> Is this the internal structure? Or something that userspace has to fill in?

    Yes, the user space have to pass that to the driver which constructs the 
display lists using these data.

> It's not clear at all.
>
> I recommend giving a few code examples of how this should be used.

    Konstantin, can we give some examples?

>> +
>> +**Return value**:
>> +
>> +    On success 0 is returned. On error -1 is returned and errno is set
>> +    appropriately.
>> +
>> +**Data types**:
>> +
>> +.. code-block:: none
>> +
>> +    * struct imr_map_desc
>> +
>> +    __u32    type        mapping types
>
> This is a bitmask? If so, what combination of bits are allowed?

    Yes, bitmask.

>> +    __u32    size        total size of the mesh structure
>> +    __u64    data        map-specific user-pointer
>> +
>> +    IMR_MAP_MESH        regular mesh specification
>> +    IMR_MAP_AUTOSG        auto-generated source coordinates
>> +    IMR_MAP_AUTODG        auto-generated destination coordinates
>> +    IMR_MAP_LUCE        luminance correction flag
>> +    IMR_MAP_CLCE        chromacity correction flag
>
> You probably mean 'chroma'. 'chromacity' isn't a word.

    But it's recognized by all online translators I've tried. :-)

>> +    IMR_MAP_TCM        vertex clockwise-mode order
>> +    IMR_MAP_UVDPOR(n)    source coordinate decimal point position
>> +    IMR_MAP_DDP        destination coordinate sub-pixel mode
>> +    IMR_MAP_YLDPO(n)    luminance correction offset decimal point
>> +                position
>> +    IMR_MAP_UBDPO(n)    chromacity (U) correction offset decimal point
>> +                position
>> +    IMR_MAP_VRDPO(n)    chromacity (V) correction offset decimal point
>> +                position
>
> There is no documentation what how these types relate to IMR_MAP_MESH and
> IMR_MAP_AUTOS/DG.

    They are basically orthogonal, IIRC.

>> +
>> +    * struct imr_mesh    regular mesh specification
>> +
>> +    __u16    rows, columns    rectangular mesh sizes
>> +    __u16    x0, y0, dx, dy    auto-generated mesh parameters
>> +
>> +    * struct imr_vbo    vertex-buffer-object (VBO) descriptor
>> +
>> +    __u16    num        number of triangles
>
> Sorry, this needs more work.

    Sigh, everybody hates writing docs, I guess... :-)

> Regards,
>
>     Hans

MBR, Sergei

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
