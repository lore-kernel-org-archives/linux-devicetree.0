From: Frank Rowand <frowand.list@gmail.com>
Subject: Re: [RFC 0/2] of: Add whitelist
Date: Wed, 29 Nov 2017 04:20:27 -0500
Message-ID: <da4c9b29-eccc-6a67-291a-73a36c1598b5@gmail.com>
References: <1511816284-12145-1-git-send-email-atull@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1511816284-12145-1-git-send-email-atull@kernel.org>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Alan Tull <atull@kernel.org>, Rob Herring <robh+dt@kernel.org>, Pantelis Antoniou <pantelis.antoniou@konsulko.com>
Cc: Moritz Fischer <mdf@kernel.org>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-fpga@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On 11/27/17 15:58, Alan Tull wrote:
> Here's a proposal for a whitelist to lock down the dynamic device tree.
> 
> For an overlay to be accepted, all of its targets are required to be
> on a target node whitelist.
> 
> Currently the only way I have to get on the whitelist is calling a
> function to add a node.  That works for fpga regions, but I think
> other uses will need a way of having adding specific nodes from the
> base device tree, such as by adding a property like 'allow-overlay;'
> or 'allow-overlay = "okay";' If that is acceptable, I could use some
> advice on where that particular code should go.
> 
> Alan
> 
> Alan Tull (2):
>   of: overlay: add whitelist
>   fpga: of region: add of-fpga-region to whitelist
> 
>  drivers/fpga/of-fpga-region.c |  9 ++++++
>  drivers/of/overlay.c          | 73 +++++++++++++++++++++++++++++++++++++++++++
>  include/linux/of.h            | 12 +++++++
>  3 files changed, 94 insertions(+)
> 

The plan was to use connectors to restrict where an overlay could be applied.
I would prefer not to have multiple methods for accomplishing the same thing
unless there is a compelling reason to do so.

-Frnank
