From: Sylwester Nawrocki <s.nawrocki@samsung.com>
Subject: Re: [PATCH RFC v3 01/15] [media] Add common video interfaces OF
 bindings documentation
Date: Wed, 23 Jan 2013 11:21:24 +0100
Message-ID: <50FFB9A4.1090300@samsung.com>
References: <1356969793-27268-2-git-send-email-s.nawrocki@samsung.com>
 <1357232629-7336-1-git-send-email-s.nawrocki@samsung.com>
 <201301211131.11047.hverkuil@xs4all.nl>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-media-owner@vger.kernel.org>
In-reply-to: <201301211131.11047.hverkuil@xs4all.nl>
Sender: linux-media-owner@vger.kernel.org
To: Hans Verkuil <hverkuil@xs4all.nl>
Cc: linux-media@vger.kernel.org, g.liakhovetski@gmx.de, laurent.pinchart@ideasonboard.com, grant.likely@secretlab.ca, rob.herring@calxeda.com, thomas.abraham@linaro.org, t.figa@samsung.com, sw0312.kim@samsung.com, kyungmin.park@samsung.com, devicetree-discuss@lists.ozlabs.org
List-Id: devicetree@vger.kernel.org

Hi Hans,

On 01/21/2013 11:31 AM, Hans Verkuil wrote:
[...]
>> +Required properties
>> +-------------------
>> +
>> +If there is more than one 'port' or more than one 'endpoint' node following
>> +properties are required in relevant parent node:
>> +
>> +- #address-cells : number of cells required to define port number, should be 1.
>> +- #size-cells    : should be zero.
>> +
>> +Optional endpoint properties
>> +----------------------------
>> +
>> +- remote-endpoint: phandle to an 'endpoint' subnode of the other device node.
>> +- slave-mode: a boolean property, run the link in slave mode. Default is master
>> +  mode.
>> +- bus-width: number of data lines, valid for parallel busses.
>> +- data-shift: on parallel data busses, if bus-width is used to specify the
>> +  number of data lines, data-shift can be used to specify which data lines are
>> +  used, e.g. "bus-width=<10>; data-shift=<2>;" means, that lines 9:2 are used.
>> +- hsync-active: active state of HSYNC signal, 0/1 for LOW/HIGH respectively.
>> +- vsync-active: active state of VSYNC signal, 0/1 for LOW/HIGH respectively.
>> +  Note, that if HSYNC and VSYNC polarities are not specified, embedded
>> +  synchronization may be required, where supported.
>> +- data-active: similar to HSYNC and VSYNC, specifies data line polarity.
>> +- field-even-active: field signal level during the even field data transmission.
>> +- pclk-sample: sample data on rising (1) or falling (0) edge of the pixel clock
>> +  signal.
>> +- data-lanes: an array of physical data lane indexes. Position of an entry
>> +  determines logical lane number, while the value of an entry indicates physical
>> +  lane, e.g. for 2-lane MIPI CSI-2 bus we could have "data-lanes = <1>, <2>;",
>> +  assuming the clock lane is on hardware lane 0. This property is valid for
>> +  serial busses only (e.g. MIPI CSI-2).
>> +- clock-lanes: a number of physical lane used as a clock lane.
> 
> This doesn't parse. Do you mean:
> 
> "a number of physical lanes used as clock lanes."?

Not really, an index (an array of indexes?) of physical lanes(s) used as clock
lane (s).

Currently there are only use cases for one clock lane (MIPI CSI-2 bus).
I'm not sure what's better, to keep that in singular (clock-lane) or plural
form. The plural form seems more generic. So I'm inclined to define it as:

clock-lanes - similarly to 'data-lanes' property, an array of physical
clock lane indexes. For MIPI CSI-2 bus this array contains only one entry.

Would it be OK like this ?

>> +- clock-noncontinuous: a boolean property to allow MIPI CSI-2 non-continuous
>> +  clock mode.
>> +
>> +Example
>> +-------
>> +
>> +The below example snippet describes two data pipelines.  ov772x and imx074 are
> 
> s/below example snippet/example snippet below/
> 
>> +camera sensors with parallel and serial (MIPI CSI-2) video bus respectively.
> 
> s/with/with a/
> 
>> +Both sensors are on I2C control bus corresponding to i2c0 controller node.
> 
> s/on/on the/
> s/to/to the/
> 
>> +ov772x sensor is linked directly to the ceu0 video host interface.  imx074 is
>> +linked to ceu0 through MIPI CSI-2 receiver (csi2). ceu0 has a (single) DMA
> 
> s/through/through the/
> 
>> +engine writing captured data to memory.  ceu0 node has single 'port' node which
> 
> s/single/a single/
> 
>> +indicates at any time only one of following data pipeline can be active:
> 
> s/at/that at/
> s/one of/one of the/
> s/pipeline/pipelines/

Ok, I'll corect all these. Thanks.

--

Regards,
Sylwester
