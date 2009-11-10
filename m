From: Nathan Fontenot <nfont@austin.ibm.com>
Subject: Re: [PATCH 09/11] of: merge prom_{add,remove,modify}_property
Date: Tue, 10 Nov 2009 14:33:51 -0600
Message-ID: <4AF9CE2F.7080502@austin.ibm.com>
References: <20091105073728.10460.6061.stgit@angua> <20091105074656.10460.29333.stgit@angua>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <sparclinux-owner@vger.kernel.org>
In-Reply-To: <20091105074656.10460.29333.stgit@angua>
Sender: sparclinux-owner@vger.kernel.org
To: Grant Likely <grant.likely@secretlab.ca>
Cc: linuxppc-dev@lists.ozlabs.org, devicetree-discuss@lists.ozlabs.org, benh@kernel.crashing.org, sfr@canb.auug.org.au, davem@davemloft.net, sparclinux@vger.kernel.org, monstr@monstr.eu, microblaze-uclinux@itee.uq.edu.au
List-Id: devicetree@vger.kernel.org

Grant Likely wrote:
> Merge common code between PowerPC and MicroBlaze
> 
> Signed-off-by: Grant Likely <grant.likely@secretlab.ca>
> ---
> 
>  arch/microblaze/kernel/prom.c |  113 ----------------------------------------
>  arch/powerpc/kernel/prom.c    |  114 ----------------------------------------
>  drivers/of/base.c             |  116 +++++++++++++++++++++++++++++++++++++++++
>  3 files changed, 116 insertions(+), 227 deletions(-)
> 

Should the prom_{add,remove,update}_property routines belong in base.c or
of_dynamic.c (patches coming soon for of_dynamic.c)?  

My original patch set put these routines in of_dynamic.c and renamed
them to of_{add,remove,update}_property since they are part of the of
code.

-Nathan Fontenot
