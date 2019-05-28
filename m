From: Jean-Philippe Brucker <jean-philippe.brucker@arm.com>
Subject: Re: [PATCH v7 0/7] Add virtio-iommu driver
Date: Tue, 28 May 2019 10:18:21 +0100
Message-ID: <99ff5494-bfdf-f4ef-b2d2-c177add385c6@arm.com>
References: <20190115121959.23763-1-jean-philippe.brucker@arm.com>
 <20190512123022-mutt-send-email-mst@kernel.org>
 <20190527092604.GB21613@8bytes.org>
 <20190527111345-mutt-send-email-mst@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <kvmarm-bounces@lists.cs.columbia.edu>
In-Reply-To: <20190527111345-mutt-send-email-mst@kernel.org>
Content-Language: en-US
List-Unsubscribe: <https://lists.cs.columbia.edu/mailman/options/kvmarm>,
 <mailto:kvmarm-request@lists.cs.columbia.edu?subject=unsubscribe>
List-Archive: <https://lists.cs.columbia.edu/pipermail/kvmarm>
List-Post: <mailto:kvmarm@lists.cs.columbia.edu>
List-Help: <mailto:kvmarm-request@lists.cs.columbia.edu?subject=help>
List-Subscribe: <https://lists.cs.columbia.edu/mailman/listinfo/kvmarm>,
 <mailto:kvmarm-request@lists.cs.columbia.edu?subject=subscribe>
Errors-To: kvmarm-bounces@lists.cs.columbia.edu
Sender: kvmarm-bounces@lists.cs.columbia.edu
To: "Michael S. Tsirkin" <mst@redhat.com>, Joerg Roedel <joro@8bytes.org>
Cc: "virtio-dev@lists.oasis-open.org" <virtio-dev@lists.oasis-open.org>, "kevin.tian@intel.com" <kevin.tian@intel.com>, Lorenzo Pieralisi <Lorenzo.Pieralisi@arm.com>, "tnowicki@caviumnetworks.com" <tnowicki@caviumnetworks.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Marc Zyngier <Marc.Zyngier@arm.com>, "linux-pci@vger.kernel.org" <linux-pci@vger.kernel.org>, "jasowang@redhat.com" <jasowang@redhat.com>, Will Deacon <Will.Deacon@arm.com>, Robin Murphy <Robin.Murphy@arm.com>, "virtualization@lists.linux-foundation.org" <virtualization@lists.linux-foundation.org>, "iommu@lists.linux-foundation.org" <iommu@lists.linux-foundation.org>, "robh+dt@kernel.org" <robh+dt@kernel.org>, "bhelgaas@google.com" <bhelgaas@google.com>, "frowand.list@gmail.com" <frowand.list@gmail.com>, "kvmarm@lists.cs.columbia.edu" <kvmarm@lists.cs.columbia.edu>
List-Id: devicetree@vger.kernel.org

On 27/05/2019 16:15, Michael S. Tsirkin wrote:
> On Mon, May 27, 2019 at 11:26:04AM +0200, Joerg Roedel wrote:
>> On Sun, May 12, 2019 at 12:31:59PM -0400, Michael S. Tsirkin wrote:
>>> OK this has been in next for a while.
>>>
>>> Last time IOMMU maintainers objected. Are objections
>>> still in force?
>>>
>>> If not could we get acks please?
>>
>> No objections against the code, I only hesitated because the Spec was
>> not yet official.
>>
>> So for the code:
>>
>> 	Acked-by: Joerg Roedel <jroedel@suse.de>
> 
> Last spec patch had a bunch of comments not yet addressed.
> But I do not remember whether comments are just about wording
> or about the host/guest interface as well.
> Jean-Philippe could you remind me please?

It's mostly wording, but there is a small change in the config space
layout and two new feature bits. I'll send a new version of the driver
when possible.

Thanks,
Jean
