From: Timur Tabi <timur@freescale.com>
Subject: Re: [PATCH 5/7] arch/powerpc/sysdev/qe_lib/qe.c: Add of_node_put
 to avoid memory leak
Date: Mon, 30 Aug 2010 15:39:20 -0500
Message-ID: <4C7C16F8.7060905@freescale.com>
References: <1283075566-27441-1-git-send-email-julia@diku.dk> <1283075566-27441-6-git-send-email-julia@diku.dk>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1283075566-27441-6-git-send-email-julia@diku.dk>
Sender: linux-kernel-owner@vger.kernel.org
To: Julia Lawall <julia@diku.dk>
Cc: kernel-janitors@vger.kernel.org, Benjamin Herrenschmidt <benh@kernel.crashing.org>, Paul Mackerras <paulus@samba.org>, Grant Likely <grant.likely@secretlab.ca>, linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org, devicetree-discuss@lists.ozlabs.org
List-Id: devicetree@vger.kernel.org

Julia Lawall wrote:
> Add a call to of_node_put in the error handling code following a call to
> of_find_compatible_node.

Acked-by: Timur Tabi <timur@freescale.com>

Thanks, Julia.  Your work in finding these kinds of bugs is very much
appreciated.
