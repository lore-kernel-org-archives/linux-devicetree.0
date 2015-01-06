From: Stanimir Varbanov <svarbanov@mm-sol.com>
Subject: Re: [PATCH 5/5] ARM: qcom: Add Qualcomm APQ8084 SoC
Date: Tue, 06 Jan 2015 17:24:22 +0200
Message-ID: <54ABFE26.9010208@mm-sol.com>
References: <1418404441-5518-1-git-send-email-svarbanov@mm-sol.com> <1418404441-5518-6-git-send-email-svarbanov@mm-sol.com> <1671186.DiHNtkP1SP@wuerfel>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-msm-owner@vger.kernel.org>
In-Reply-To: <1671186.DiHNtkP1SP@wuerfel>
Sender: linux-arm-msm-owner@vger.kernel.org
To: Arnd Bergmann <arnd@arndb.de>
Cc: Rob Herring <robh+dt@kernel.org>, Kumar Gala <galak@codeaurora.org>, Mark Rutland <mark.rutland@arm.com>, Grant Likely <grant.likely@linaro.org>, Bjorn Helgaas <bhelgaas@google.com>, Kishon Vijay Abraham I <kishon@ti.com>, Russell King <linux@arm.linux.org.uk>, linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-pci@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Hi Arnd,

Thanks for the comments!

On 12/12/2014 07:33 PM, Arnd Bergmann wrote:
> On Friday 12 December 2014 19:14:01 Stanimir Varbanov wrote:
>> +config ARCH_APQ8084
>> +       bool "Enable support for APQ8084"
>> +       select HAVE_ARM_ARCH_TIMER
>> +       select PCI
>> +       select PCI_DOMAINS
>> +       select PCI_MSI
>> +
> 
> I would prefer not to see 'select PCI' here. Also the driver is written
> to work without PCI_MSI, so I'd be much happier with just
> 
> config ARCH_APQ8084
> 	bool "Enable support for APQ8084"
> 	select HAVE_ARM_ARCH_TIMER
> 	select PCI_DOMAINS if PCI

What about this

config ARCH_APQ8084
	bool "Enable support for APQ8084"
	select HAVE_ARM_ARCH_TIMER
	select MIGHT_HAVE_PCI
	select PCI_DOMAINS if PCI

-- 
regards,
Stan
