From: Gabriel Fernandez <gabriel.fernandez@linaro.org>
Subject: Re: [PATCH v2 4/5] PCI: designware: Add disable IO support
Date: Tue, 17 Mar 2015 08:49:17 +0100
Message-ID: <CAG374jCD05qXiMfCZOPFvaxYLgU75CR3Kiryxxxz1CzmgVOsjg@mail.gmail.com>
References: <1426515635-9466-1-git-send-email-gabriel.fernandez@linaro.org>
	<1426515635-9466-5-git-send-email-gabriel.fernandez@linaro.org>
	<550718B4.5090406@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <550718B4.5090406@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Cc: Gabriel FERNANDEZ <gabriel.fernandez@st.com>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Srinivas Kandagatla <srinivas.kandagatla@gmail.com>, Maxime Coquelin <maxime.coquelin@st.com>, Patrice Chotard <patrice.chotard@st.com>, Russell King <linux@arm.linux.org.uk>, Bjorn Helgaas <bhelgaas@google.com>, Mohit Kumar <mohit.kumar@st.com>, Jingoo Han <jg1.han@samsung.com>, Lucas Stach <l.stach@pengutronix.de>, Fabrice Gasnier <fabrice.gasnier@st.com>, Kishon Vijay Abraham I <kishon@ti.com>, Andrew Morton <akpm@linux-foundation.org>, "David S. Miller" <davem@davemloft.net>, Greg KH <gregkh@linuxfoundation.org>, Mauro Carvalho Chehab <mchehab@osg.samsung.com>, Joe Perches <joe@perches.com>, Tejun Heo <tj@kernel.org>, Arnd
List-Id: devicetree@vger.kernel.org

Hi Srinivas,

Yes, you are right.

Nevertheless i'll try the Kumar and Arnd 's request to not use DT to do that.

BR

Gabriel

On 16 March 2015 at 18:53, Srinivas Kandagatla
<srinivas.kandagatla@linaro.org> wrote:
>
>
> On 16/03/15 14:20, Gabriel FERNANDEZ wrote:
>>
>>   - bus-range: PCI bus numbers covered (it is recommended for new
>> devicetrees to
>>     specify this property, to keep backwards compatibility a range of
>> 0x00-0xff
>>     is assumed if not present)
>> +- disable_io_support: set this property for PCIe host controller without
>> IO
>> +  port access
>
> Shouldn't dt properties use hyphens rather than under scores ?
