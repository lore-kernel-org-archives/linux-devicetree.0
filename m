From: Benjamin Herrenschmidt <benh@kernel.crashing.org>
Subject: Re: [PATCH v2 6/8] PCI: al: Add support for DW based driver type
Date: Mon, 22 Jul 2019 10:47:06 +1000
Message-ID: <bed99b3d9b4ea5ddba568dd65b3a4aad4ad837bd.camel@kernel.crashing.org>
References: <20190718094531.21423-1-jonnyc@amazon.com>
         <20190718094718.25083-2-jonnyc@amazon.com>
         <DM6PR12MB4010913E5408349A600762CADACB0@DM6PR12MB4010.namprd12.prod.outlook.com>
         <d323007c6bf14cb9f90a497a26b66dac151164fc.camel@amazon.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <d323007c6bf14cb9f90a497a26b66dac151164fc.camel@amazon.com>
Sender: linux-kernel-owner@vger.kernel.org
To: "Chocron, Jonathan" <jonnyc@amazon.com>, "jingoohan1@gmail.com" <jingoohan1@gmail.com>, "mark.rutland@arm.com" <mark.rutland@arm.com>, "lorenzo.pieralisi@arm.com" <lorenzo.pieralisi@arm.com>, "Gustavo.Pimentel@synopsys.com" <Gustavo.Pimentel@synopsys.com>, "bhelgaas@google.com" <bhelgaas@google.com>, "robh+dt@kernel.org" <robh+dt@kernel.org>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "Woodhouse, David" <dwmw@amazon.co.uk>, "Hanoch, Uri" <hanochu@amazon.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "Wasserstrom, Barak" <barakw@amazon.com>, "Saidi, Ali" <alisaidi@amazon.com>, "Hawa, Hanna" <hhhawa@amazon.com>, "Shenhar, Talel" <talel@amazon.com>, "Krupnik, Ronen" <ronenk@amazon.com>, "linux-pci@vger.kernel.org" <linux-pci@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Sun, 2019-07-21 at 15:08 +0000, Chocron, Jonathan wrote:
> > Please sort the variables following the reverse tree order.
> > 
> 
> Done. 
> 
> I'd think that it would make sense to group variables which have a
> common characteristic (e.g. resources read from the DT), even if it
> mildly breaks the convention (as long as the general frame is longest
> to shortest). Does this sound ok?
> 
> BTW, I couldn't find any documentation regarding the reverse-tree
> convention, do you have a pointer to some?

It's a complete stupidity that people who have nothing better to
comment about keep throwing at you when you are trying to get stuff
working.

Yes, we should avoid ugly stuff such as

	int rc;
	struct something_very_long foo;

But this definitely should come second to saner ordering such as the
one you propose of grouping related things together. At least IMHO.

You'll notice that the kernel these days attract way more people
interested in commenting to death on various minor points of coding
style than actual worthwhile technical comments on the code.

Cheers,
Ben.
