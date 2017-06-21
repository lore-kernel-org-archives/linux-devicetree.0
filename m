From: Frank Rowand <frowand.list@gmail.com>
Subject: Re: [PATCH v6 1/4] of: remove *phandle properties from expanded
 device tree
Date: Wed, 21 Jun 2017 12:25:44 -0700
Message-ID: <594AC838.5010901@gmail.com>
References: <1497996172-821-1-git-send-email-frowand.list@gmail.com>
 <1497996172-821-2-git-send-email-frowand.list@gmail.com>
 <87mv92szsw.fsf@concordia.ellerman.id.au> <594A0FB6.2000102@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <594A0FB6.2000102@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Michael Ellerman <mpe@ellerman.id.au>, Rob Herring <robh+dt@kernel.org>, Nathan Fontenot <nfont@linux.vnet.ibm.com>, Tyrel Datwyler <tyreld@linux.vnet.ibm.com>
Cc: devicetree@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On 06/20/17 23:18, Frank Rowand wrote:
> Hi Rob,
> 
> Michael has an issue that means this patch series is not OK in the
> current form.  I will work on a v7 to see if I can resolve the
> issue.
> 
> -Frank

< snip >

Hi Rob,

The issue is in patch 1.  Patches 2 - 4 are small independent patches
that are not dependent on patch 1, so I just sent them as individual
patches.  Version 7 of this series will be just patch 1.

-Frank
