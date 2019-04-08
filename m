From: Mickael GUENE <mickael.guene@st.com>
Subject: Re: [PATCH v4 1/2] dt-bindings: Document MIPID02 bindings
Date: Mon, 8 Apr 2019 06:20:35 +0000
Message-ID: <9361076f-9007-fba8-302d-c32cdb8f5c87@st.com>
References: <1552373045-134493-1-git-send-email-mickael.guene@st.com>
 <1553680545-73278-1-git-send-email-mickael.guene@st.com>
 <1553680545-73278-2-git-send-email-mickael.guene@st.com>
 <20190406103525.amfsljsz4twi3xq2@valkosipuli.retiisi.org.uk>
 <20190406103826.cniksvg7xuog3gti@valkosipuli.retiisi.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190406103826.cniksvg7xuog3gti@valkosipuli.retiisi.org.uk>
Content-Language: en-US
Content-ID: <89241381E136EC43A4987D746E920DB5@st.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Sakari Ailus <sakari.ailus@iki.fi>
Cc: "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>, Hugues FRUCHET <hugues.fruchet@st.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "David S. Miller" <davem@davemloft.net>, Nicolas Ferre <nicolas.ferre@microchip.com>, Rob Herring <robh+dt@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Mark Rutland <mark.rutland@arm.com>
List-Id: devicetree@vger.kernel.org

Hi Sakari,

On 4/6/19 12:38, Sakari Ailus wrote:
> On Sat, Apr 06, 2019 at 01:35:25PM +0300, Sakari Ailus wrote:
>> Hi Mickael,
>>
>> On Wed, Mar 27, 2019 at 10:55:43AM +0100, Mickael Guene wrote:
>>> This adds documentation of device tree for MIPID02 CSI-2 to PARALLEL
>>> bridge.
>>>
>>> Signed-off-by: Mickael Guene <mickael.guene@st.com>
>>> ---
>>>
>>> Changes in v4:
>>> - Fix and clarify endpoints properties documentation
>>>
>>> Changes in v3: None
>>> Changes in v2:
>>> - Add precision about first CSI-2 port data rate
>>> - Document endpoints supported properties
>>> - Rename 'mipid02@14' into generic 'csi2rx@14' in example
>>>
>>>  .../bindings/media/i2c/st,st-mipid02.txt           | 82 ++++++++++++++=
++++++++
>>>  MAINTAINERS                                        |  7 ++
>>>  2 files changed, 89 insertions(+)
>>>  create mode 100644 Documentation/devicetree/bindings/media/i2c/st,st-m=
ipid02.txt
>>>
>>> diff --git a/Documentation/devicetree/bindings/media/i2c/st,st-mipid02.=
txt b/Documentation/devicetree/bindings/media/i2c/st,st-mipid02.txt
>>> new file mode 100644
>>> index 0000000..754a175
>>> --- /dev/null
>>> +++ b/Documentation/devicetree/bindings/media/i2c/st,st-mipid02.txt
>>> @@ -0,0 +1,82 @@
>>> +STMicroelectronics MIPID02 CSI-2 to PARALLEL bridge
>>> +
>>> +MIPID02 has two CSI-2 input ports, only one of those ports can be acti=
ve at a
>>> +time. Active port input stream will be de-serialized and its content o=
utputted
>>> +through PARALLEL output port.
>>> +CSI-2 first input port is a dual lane 800Mbps per lane whereas CSI-2 s=
econd
>>> +input port is a single lane 800Mbps. Both ports support clock and data=
 lane
>>> +polarity swap. First port also supports data lane swap.
>>> +PARALLEL output port has a maximum width of 12 bits.
>>> +Supported formats are RAW6, RAW7, RAW8, RAW10, RAW12, RGB565, RGB888, =
RGB444,
>>> +YUV420 8-bit, YUV422 8-bit and YUV420 10-bit.
>>> +
>>> +Required Properties:
>>> +- compatible: should be "st,st-mipid02"
>>
>> s/should/shall/ overall; other values aren't really valid in any of the
>> cases.
>=20
> As this is the only change and it's trivial, I can do that as well. Let m=
e
> know if that works for you.
>=20
 I prefer to keep it with my patch serie if you are ok ?

Mickael=
