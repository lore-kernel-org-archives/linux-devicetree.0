From: Jason Gunthorpe <jgunthorpe@obsidianresearch.com>
Subject: Re: [RFC PATCH V3 1/4] pci: APM X-Gene PCIe controller driver
Date: Mon, 3 Feb 2014 15:15:59 -0700
Message-ID: <20140203221559.GG2519@obsidianresearch.com>
References: <1390599168-13150-1-git-send-email-tinamdar@apm.com>
 <201401301516.27091.arnd@arndb.de>
 <CACoXjcnXoysMeBsGuOb3t5b10zdeJ8pOnuOOzR8AaZhsOOYVEw@mail.gmail.com>
 <4985267.LnsktRmabM@wuerfel>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-doc-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <4985267.LnsktRmabM@wuerfel>
Sender: linux-doc-owner@vger.kernel.org
To: Arnd Bergmann <arnd@arndb.de>
Cc: Tanmay Inamdar <tinamdar@apm.com>, Bjorn Helgaas <bhelgaas@google.com>, Grant Likely <grant.likely@linaro.org>, Rob Herring <robh+dt@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, Rob Landley <rob@landley.net>, "linux-pci@vger.kernel.org" <linux-pci@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, patches <patches@apm.com>, Jon Masters <jcm@redhat.com>, Liviu Dudau <Liviu.Dudau@arm.com>
List-Id: devicetree@vger.kernel.org

On Mon, Feb 03, 2014 at 09:12:32PM +0100, Arnd Bergmann wrote:

> Are you sure that is true for the root bridge as well? I don't
> remember the details, but I though that for the host bridge,
> we don't actually look at the BARs at all.

That is right, but this isn't a host bridge device, it is a PCI-PCI
bridge with root complex registers. The root complex bridge is not the
same as the host bridge.

Unfortunately the implementation is non-conforming. :(

Jason
