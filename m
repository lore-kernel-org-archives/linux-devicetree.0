From: "H. Nikolaus Schaller" <hns@goldelico.com>
Subject: Re: [PATCH v1 0/6] Add support of OV9655 camera
Date: Fri, 23 Jun 2017 12:25:09 +0200
Message-ID: <1E453955-0C1A-414B-BBB2-C64B6D0EF378@goldelico.com>
References: <1498143942-12682-1-git-send-email-hugues.fruchet@st.com>
 <385A82AC-CC23-41BD-9F57-0232F713FED9@goldelico.com>
Mime-Version: 1.0 (Mac OS X Mail 9.3 \(3124\))
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <385A82AC-CC23-41BD-9F57-0232F713FED9@goldelico.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Hugues Fruchet <hugues.fruchet@st.com>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree <devicetree@vger.kernel.org>, Discussions about the Letux Kernel <letux-kernel@openphoenux.org>, Alexandre Torgue <alexandre.torgue@st.com>, LKML <linux-kernel@vger.kernel.org>, Guennadi Liakhovetski <g.liakhovetski@gmx.de>, Hans Verkuil <hverkuil@xs4all.nl>, Rob Herring <robh+dt@kernel.org>, linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, Benjamin Gaignard <benjamin.gaignard@linaro.org>, Sylwester Nawrocki <sylvester.nawrocki@gmail.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, Yannick Fertre <yannick.fertre@st.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, linux-media@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Hi Hugues,

> Am 22.06.2017 um 17:41 schrieb H. Nikolaus Schaller <hns@goldelico.com>:
> 
> 
>> Am 22.06.2017 um 17:05 schrieb Hugues Fruchet <hugues.fruchet@st.com>:
>> 
>> This patchset enables OV9655 camera support.
>> 
>> OV9655 support has been tested using STM32F4DIS-CAM extension board
>> plugged on connector P1 of STM32F746G-DISCO board.
>> Due to lack of OV9650/52 hardware support, the modified related code
>> could not have been checked for non-regression.
>> 
>> First patches upgrade current support of OV9650/52 to prepare then
>> introduction of OV9655 variant patch.
>> Because of OV9655 register set slightly different from OV9650/9652,
>> not all of the driver features are supported (controls). Supported
>> resolutions are limited to VGA, QVGA, QQVGA.
>> Supported format is limited to RGB565.
>> Controls are limited to color bar test pattern for test purpose.
>> 
>> OV9655 initial support is based on a driver written by H. Nikolaus Schaller [1].
> 
> Great!

Thanks again for picking up or work and trying to get it upstream.

> 
> I will test as soon as possible.

I have tried and had to fix some issues first:
* gpio properties have a different name than in our approach (but that is something maintainers have to decide and is easy to follow this or that way)
* there is no clock-frequency property which makes the driver request a clock frequency (something our camera interface expects this way)
* there is no vana-supply regulator and we need that to power on/off the camera on demand (reset and pwdn isn't enough in our hardware)
* for some unknown reason the driver does not load automatically from DT compatibility string and needs to be explicitly modprobed
* unfortunately we still get no image :(

The latter is likely a setup issue of our camera interface (OMAP3 ISP = Image Signal Processor) which
we were not yet able to solve. Oscilloscoping signals on the interface indicated that signals and
sync are correct. But we do not know since mplayer only shows a green screen.

Therefore we had not submitted anything upstream ourselves, because our driver setup
isn't finished and completely working.

I have written some more specific comments linked to proposals for patches as answer to your [PATCH v1 1/6]

BR and thanks,
Nikolaus
