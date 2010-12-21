From: Michal Marek <mmarek@suse.cz>
Subject: Re: [PATCH 1/4] of: Add support for linking device tree blobs into
 vmlinux
Date: Tue, 21 Dec 2010 15:24:42 +0100
Message-ID: <4D10B8AA.3070500@suse.cz>
References: <cover.1291820033.git.dirk.brandewie@gmail.com> <99ff131ecbee621f0d3178d6d3896d6f39207d6f.1291820034.git.dirk.brandewie@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-2
Content-Transfer-Encoding: 7bit
Return-path: <linux-arch-owner@vger.kernel.org>
In-Reply-To: <99ff131ecbee621f0d3178d6d3896d6f39207d6f.1291820034.git.dirk.brandewie@gmail.com>
Sender: linux-arch-owner@vger.kernel.org
To: dirk.brandewie@gmail.com
Cc: linux-kernel@vger.kernel.org, devicetree-discuss@lists.ozlabs.org, sodaville@linutronix.de, linuxppc-dev@lists.ozlabs.org, microblaze-uclinux@itee.uq.edu.au, linux-arch@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On 8.12.2010 16:01, dirk.brandewie@gmail.com wrote:
> +quiet_cmd_dt_S_dtb= DTB    $@

> +quiet_cmd_dtc = DTC $@

Hi,

just an aesthetic remark: The target name should start at the 9th
column, so there should be 5 spaces after both "DTB" and "DTC".

Michal
