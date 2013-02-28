From: Stephen Warren <swarren@wwwdotorg.org>
Subject: Re: [PATCH 1/4] documentation: add palmas dts definition
Date: Thu, 28 Feb 2013 12:01:53 -0700
Message-ID: <512FA9A1.7070701@wwwdotorg.org>
References: <1361164283-3133-1-git-send-email-j-keerthy@ti.com> <512E5144.9020105@wwwdotorg.org> <512F1ADF.90906@nvidia.com> <512F2A29.8080708@slimlogic.co.uk> <512F3118.6030806@nvidia.com> <512F3810.30109@slimlogic.co.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-doc-owner@vger.kernel.org>
In-Reply-To: <512F3810.30109@slimlogic.co.uk>
Sender: linux-doc-owner@vger.kernel.org
To: Graeme Gregory <gg@slimlogic.co.uk>
Cc: Laxman Dewangan <ldewangan@nvidia.com>, J Keerthy <j-keerthy@ti.com>, "grant.likely@secretlab.ca" <grant.likely@secretlab.ca>, "rob.herring@calxeda.com" <rob.herring@calxeda.com>, "rob@landley.net" <rob@landley.net>, "devicetree-discuss@lists.ozlabs.org" <devicetree-discuss@lists.ozlabs.org>, "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "b-cousson@ti.com" <b-cousson@ti.com>
List-Id: devicetree@vger.kernel.org

On 02/28/2013 03:57 AM, Graeme Gregory wrote:
...
> The final but of information that would be needed is some method to pass
> down product_id/design_rev and for a lot of the IP blocks they could be
> made independent of the actual parent.

That should probably be represented in DT itself as differing compatible
values.

I could see the argument that this is SW-probe-able since there's a
register that defines the value. However, any global ID register would
apply to the top-level device, and not the version of any child IP
blocks if there's the possibility of mixing/matching IP blocks. If
there's a dedicated version register for a child IP block, then
presumably it's already part of the child IP block's register space, and
so the driver can read it, and then there perhaps wouldn't be a need to
represent this using different compatible values.
