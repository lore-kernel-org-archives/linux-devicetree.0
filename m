From: Suzuki K Poulose <Suzuki.Poulose@arm.com>
Subject: Re: [PATCH 1/3] arm64: dts: juno: add coresight support
Date: Tue, 21 Jun 2016 09:44:28 +0100
Message-ID: <5768FE6C.3080809@arm.com>
References: <1465228765-14038-1-git-send-email-sudeep.holla@arm.com>
 <1465228765-14038-2-git-send-email-sudeep.holla@arm.com>
 <CAOesGMjQNEOcmYpUAxUxBJLyUYZQuRKK48a31Ys9LuTJFWqMFA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <CAOesGMjQNEOcmYpUAxUxBJLyUYZQuRKK48a31Ys9LuTJFWqMFA@mail.gmail.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Olof Johansson <olof@lixom.net>, Sudeep Holla <sudeep.holla@arm.com>
Cc: Jon Medhurst <tixy@linaro.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>, Mathieu Poirier <mathieu.poirier@linaro.org>, Liviu Dudau <liviu.dudau@arm.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

On 21/06/16 06:41, Olof Johansson wrote:

Hi Olof,


>> +       /*
>> +        * Juno TRMs specify the size for these coresight components as 64K.
>> +        * The actual size is just 4K though 64K is reserved. Access to the
>> +        * unmapped reserved region results in a DECERR response.
>> +        */
>> +       etf@20010000 {
>


> Would it make sense to name it something like trace-fifo instead? We
> normally name the nodes based on type of device (ethernet@, pci@,
> etc).

ETF (Embedded Trace FIFO) is one of the modes[1] in which you can configure
the Coresight TMC at integration time. The other available modes are
ETR(Embedded Trace Router) and ETB(Embedded Trace Buffer).

>
>
>> +               compatible = "arm,coresight-tmc", "arm,primecell";
>
> Is there a more specific compatible needed here, or does
> arm,coresight-tmc give you all the information you need on how to use
> this interface?

The coresight TMC driver will read the "configured mode" to determine
the mode of operation and initialise it accordingly. Hence we don't
need a specific compatible.

>
> The bindings doc is sort of sparse in this area, all it says is "you
> might use one of these compatibles".

I agree.

>
>> +       tpiu@20030000 {
>
> Again, these names are not great. Luckily they don't affect the
> binding, so they can be fixed. What would be a more human readable and
> functionally describing name here?

Again, TPIU (Trace Port Interface Unit), is standard Coresight component in
Coresight architecture. [2]


>> +
>> +       etr@20070000 {
>
> Again..
>

Same as ETF [1]

>> +
>> +       etm0: etm@22040000 {
>
> If this file is sorted on reg values, then this node and the two after
> are out of order.

They are numbered after the CPU which they are associated with. This is used
to reuse the dts for Juno-r0/r1 vs r2 (where we have A72 replacing A57).


[1] http://infocenter.arm.com/help/index.jsp?topic=/com.arm.doc.ddi0461b/CACECIII.html
[2] http://infocenter.arm.com/help/index.jsp?topic=/com.arm.doc.ddi0314h/Babhdhfb.html


Cheers
Suzuki
