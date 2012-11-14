From: Grant Likely <grant.likely@secretlab.ca>
Subject: Re: [PATCH 1/5] Add /proc device tree updating to of node add/remove
Date: Wed, 14 Nov 2012 14:38:27 +0000
Message-ID: <20121114143827.19DB73E0AA8@localhost>
References: <506B2E63.5090900@linux.vnet.ibm.com> <506BA905.4090000@linux.vnet.ibm.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <506BA905.4090000@linux.vnet.ibm.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Nathan Fontenot <nfont@linux.vnet.ibm.com>, devicetree-discuss@lists.ozlabs.org, cbe-oss-dev@lists.ozlabs.org, LKML <linux-kernel@vger.kernel.org>, linuxppc-dev@lists.ozlabs.org
List-Id: devicetree@vger.kernel.org

On Tue, 02 Oct 2012 21:55:01 -0500, Nathan Fontenot <nfont@linux.vnet.ibm.com> wrote:
> When adding or removing a device tree node we should also update
> the device tree in /proc/device-tree. This action is already done in the
> generic OF code for adding/removing properties of a node. This patch adds
> this functionality for nodes.
> 
> Signed-off-by: Nathan Fontenot <nfont@linux.vnet.ibm.com> 

For the whole series:

Acked-by: Grant Likely <grant.likely@secretlab.ca>
