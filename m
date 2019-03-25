From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v3 3/5] dt-bindings: display: armada: Improve the LCDC
 documentation
Date: Mon, 25 Mar 2019 14:15:48 -0500
Message-ID: <20190325191548.GA1323@bogus>
References: <20190320082057.856943-1-lkundrak@v3.sk>
 <20190320082057.856943-4-lkundrak@v3.sk>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190320082057.856943-4-lkundrak@v3.sk>
Sender: linux-kernel-owner@vger.kernel.org
To: Lubomir Rintel <lkundrak@v3.sk>
Cc: Russell King <linux@armlinux.org.uk>, Mark Rutland <mark.rutland@arm.com>, dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Wed, Mar 20, 2019 at 09:20:55AM +0100, Lubomir Rintel wrote:
> The port is a child, not a property. And should be accompanied by an
> example. Plus a pair of cosmetic changes that don't seem to deserve a
> separate commit.
> 
> Signed-off-by: Lubomir Rintel <lkundrak@v3.sk>
> 
> ---
> Changes since v2:
> - Collected the Reviewed-by tag

Really, where?

> Changes since v1:
> - Minor adjustments to the commit message wording.
> 
>  .../bindings/display/marvell,armada-lcdc.txt     | 16 ++++++++++++++--
>  1 file changed, 14 insertions(+), 2 deletions(-)
