From: Hans Verkuil <hverkuil-qWit8jRvyhVmR6Xm/wNWPw@public.gmane.org>
Subject: Re: [PATCH v9 2/9] media: v4l: Add definitions for
 MPEG-2 slice format and metadata
Date: Mon, 10 Sep 2018 12:33:52 +0200
Message-ID: <bd6dd135-1719-2e25-051b-d15b1fe52d61@xs4all.nl>
References: <20180906222442.14825-1-contact@paulk.fr>
 <20180906222442.14825-3-contact@paulk.fr>
 <9a7fd34d-50e3-4db6-4752-9e62bb160655@xs4all.nl>
 <2409ba6607e85acf3dbbaed394487fa8e92d93df.camel@paulk.fr>
Reply-To: hverkuil-qWit8jRvyhVmR6Xm/wNWPw@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-sunxi+bncBC3MVVMX3ELBBFMR3HOAKGQEGCITAJI-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
In-Reply-To: <2409ba6607e85acf3dbbaed394487fa8e92d93df.camel-W9ppeneeCTY@public.gmane.org>
Content-Language: en-US
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Paul Kocialkowski <contact-W9ppeneeCTY@public.gmane.org>, linux-media-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devel-gWbeCf7V1WCQmaza687I9mD2FQJk+8+b@public.gmane.org
Cc: Mauro Carvalho Chehab <mchehab-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Maxime Ripard <maxime.ripard-LDxbnhwyfcJBDgjK7y7TUQ@public.gmane.org>, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, Thomas Petazzoni <thomas.petazzoni-LDxbnhwyfcJBDgjK7y7TUQ@public.gmane.org>, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, Randy Li <ayaka-xPW3/0Ywev/iB9QmIjCX8w@public.gmane.org>, Ezequiel Garcia <ezequiel-ZGY8ohtN/8qB+jHODAdFcQ@public.gmane.org>, Tomasz Figa <tfiga-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Alexandre Courbot <acourbot-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Philipp Zabel <p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Laurent Pinchart <laurent.pinchart-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org>, Sakari Ailus <sakari.ailus-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On 09/10/2018 11:47 AM, Paul Kocialkowski wrote:
> Hi,
>=20
> Le lundi 10 septembre 2018 =C3=A0 11:41 +0200, Hans Verkuil a =C3=A9crit =
:
>> On 09/07/2018 12:24 AM, Paul Kocialkowski wrote:
>>> From: Paul Kocialkowski <paul.kocialkowski-LDxbnhwyfcJBDgjK7y7TUQ@public.gmane.org>
>>>
>>> Stateless video decoding engines require both the MPEG-2 slices and
>>> associated metadata from the video stream in order to decode frames.
>>>
>>> This introduces definitions for a new pixel format, describing buffers
>>> with MPEG-2 slice data, as well as control structure sfor passing the
>>> frame metadata to drivers.
>>>
>>> This is based on work from both Florent Revest and Hugues Fruchet.
>>>
>>> Signed-off-by: Paul Kocialkowski <paul.kocialkowski-LDxbnhwyfcJBDgjK7y7TUQ@public.gmane.org>
>>> ---
>>>  .../media/uapi/v4l/extended-controls.rst      | 176 ++++++++++++++++++
>>>  .../media/uapi/v4l/pixfmt-compressed.rst      |  16 ++
>>>  .../media/uapi/v4l/vidioc-queryctrl.rst       |  14 +-
>>>  .../media/videodev2.h.rst.exceptions          |   2 +
>>>  drivers/media/v4l2-core/v4l2-ctrls.c          |  63 +++++++
>>>  drivers/media/v4l2-core/v4l2-ioctl.c          |   1 +
>>>  include/media/v4l2-ctrls.h                    |  18 +-
>>>  include/uapi/linux/v4l2-controls.h            |  65 +++++++
>>>  include/uapi/linux/videodev2.h                |   5 +
>>>  9 files changed, 351 insertions(+), 9 deletions(-)
>>>
>>> diff --git a/Documentation/media/uapi/v4l/extended-controls.rst b/Docum=
entation/media/uapi/v4l/extended-controls.rst
>>> index 9f7312bf3365..f1951236266a 100644
>>> --- a/Documentation/media/uapi/v4l/extended-controls.rst
>>> +++ b/Documentation/media/uapi/v4l/extended-controls.rst
>>> @@ -1497,6 +1497,182 @@ enum v4l2_mpeg_video_h264_hierarchical_coding_t=
ype -
>>> =20
>>> =20
>>> =20
>>> +.. _v4l2-mpeg-mpeg2:
>>> +
>>> +``V4L2_CID_MPEG_VIDEO_MPEG2_SLICE_PARAMS (struct)``
>>> +    Specifies the slice parameters (as extracted from the bitstream) f=
or the
>>> +    associated MPEG-2 slice data. This includes the necessary paramete=
rs for
>>> +    configuring a stateless hardware decoding pipeline for MPEG-2.
>>> +    The bitstream parameters are defined according to :ref:`mpeg2part2=
`.
>>> +
>>> +.. c:type:: v4l2_ctrl_mpeg2_slice_params
>>> +
>>> +.. cssclass:: longtable
>>> +
>>> +.. flat-table:: struct v4l2_ctrl_mpeg2_slice_params
>>> +    :header-rows:  0
>>> +    :stub-columns: 0
>>> +    :widths:       1 1 2
>>> +
>>> +    * - __u32
>>> +      - ``bit_size``
>>> +      - Size (in bits) of the current slice data.
>>> +    * - __u32
>>> +      - ``data_bit_offset``
>>> +      - Offset (in bits) to the video data in the current slice data.
>>> +    * - struct :c:type:`v4l2_mpeg2_sequence`
>>> +      - ``sequence``
>>> +      - Structure with MPEG-2 sequence metadata, merging relevant fiel=
ds from
>>> +	the sequence header and sequence extension parts of the bitstream.
>>> +    * - struct :c:type:`v4l2_mpeg2_picture`
>>> +      - ``picture``
>>> +      - Structure with MPEG-2 picture metadata, merging relevant field=
s from
>>> +	the picture header and picture coding extension parts of the bitstrea=
m.
>>> +    * - __u8
>>> +      - ``quantiser_scale_code``
>>> +      - Code used to determine the quantization scale to use for the I=
DCT.
>>> +    * - __u8
>>> +      - ``backward_ref_index``
>>> +      - Index for the V4L2 buffer to use as backward reference, used w=
ith
>>> +	B-coded and P-coded frames.
>>> +    * - __u8
>>> +      - ``forward_ref_index``
>>> +      - Index for the V4L2 buffer to use as forward reference, used wi=
th
>>> +	P-coded frames.
>>
>> Should this be "B-coded frames"?
>=20
> Oops, that's right, B-coded frames.
>=20
> Should I make a follow-up patch for that (maybe gathered with other
> changes if required)?

Follow-up patches, please. All on top of my last pull request that adds the
cedrus driver.

Regards,

	Hans

--=20
You received this message because you are subscribed to the Google Groups "=
linux-sunxi" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to linux-sunxi+unsubscribe-/JYPxA39Uh5TLH3MbocFF+G/Ez6ZCGd0@public.gmane.org
For more options, visit https://groups.google.com/d/optout.
