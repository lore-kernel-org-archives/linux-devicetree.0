From: Michael Ellerman <michael@ellerman.id.au>
Subject: Re: [PATCH 0/5] Move some OF functionality from pseries to generic
 OF code
Date: Tue, 09 Oct 2012 10:54:29 +1100
Message-ID: <1349740469.32656.2.camel@concordia>
References: <506B2E63.5090900@linux.vnet.ibm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <506B2E63.5090900@linux.vnet.ibm.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Nathan Fontenot <nfont@linux.vnet.ibm.com>
Cc: devicetree-discuss@lists.ozlabs.org, cbe-oss-dev@lists.ozlabs.org, LKML <linux-kernel@vger.kernel.org>, linuxppc-dev@lists.ozlabs.org
List-Id: devicetree@vger.kernel.org

On Tue, 2012-10-02 at 13:11 -0500, Nathan Fontenot wrote:
> This set of patches moves some OF code that has been living
> in the pseries tree over to the generic OF code base. The
> functionality being migrated over is something that, I believe,
> should live in the generic code base. The specific functionality
> being migrated to generic OF code is;

Your changes collide with commit 475d0094293:
http://git.kernel.org/?p=linux/kernel/git/torvalds/linux-2.6.git;a=commitdiff;h=475d0094293b51353e342d1198377967dbc48169


At a quick glance they don't look like they conflict in concept, just
textually.

cheers
