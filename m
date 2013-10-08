From: Benjamin Herrenschmidt <benh@kernel.crashing.org>
Subject: Re: [RFC] Architecture independent pcibios?
Date: Wed, 09 Oct 2013 07:31:18 +1100
Message-ID: <1381264278.645.232.camel@pasglop>
References: <20131008144211.GA25231@e102652-lin.cambridge.arm.com>
	 <CAErSpo5=sUJDZGm+zHw+b1h_a1YYbaGBshAutAoPBZYUCRbYkw@mail.gmail.com>
	 <20131008171343.GB25606@e102652-lin.cambridge.arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-pci-owner@vger.kernel.org>
In-Reply-To: <20131008171343.GB25606@e102652-lin.cambridge.arm.com>
Sender: linux-pci-owner@vger.kernel.org
To: Liviu Dudau <Liviu.Dudau@arm.com>
Cc: Bjorn Helgaas <bhelgaas@google.com>, "linux-pci@vger.kernel.org" <linux-pci@vger.kernel.org>, Catalin Marinas <Catalin.Marinas@arm.com>, Olof Johansson <olof@lixom.net>, Arnd Bergmann <arnd@arndb.de>, Michal Simek <monstr@monstr.eu>, "grant.likely@linaro.org" <grant.likely@linaro.org>, "rob.herring@calxeda.com" <rob.herring@calxeda.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Tue, 2013-10-08 at 18:13 +0100, Liviu Dudau wrote:
> There are at least a handful of architectures that seem to share the same
> implementation for most (all?) of the pcibios_*() functions. (PowerPC and
> microblaze the most obvious offenders, x86 to a certain extent).

That's because microblaze started by copying the powerpc code :-) The
other part about x86 is mostly me over the year changing the powerpc
code to make it closer to x86 especially in the area of resource
management. This leads to less overall surprises and issues when the
generic code changes and in a few cases has made it easier to move bits
to the core.

The main remaining difference is our use of IORESOURCE_UNSET and our
flags to force reallocation.

Ben.
