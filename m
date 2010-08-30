From: Andres Salomon <dilinger@queued.net>
Subject: [PATCH 0/9] add OLPC device-tree support
Date: Sun, 29 Aug 2010 23:51:00 -0400
Message-ID: <20100829235100.6dcedcb8@debxo>
References: <20100628215407.2017bf2f@debian>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <sparclinux-owner@vger.kernel.org>
In-Reply-To: <20100628215407.2017bf2f@debian>
Sender: sparclinux-owner@vger.kernel.org
To: devicetree-discuss@lists.ozlabs.org
Cc: sparclinux@vger.kernel.org, x86@kernel.org, tglx@linutronix.de, mingo@redhat.com, hpa@zytor.com, cjb@laptop.org, Mitch Bradley <wmb@laptop.org>, pgf@laptop.org, linux-kernel@vger.kernel.org, davem@davemloft.net, grant.likely@secretlab.ca, Stephen Neuendorffer <stephen.neuendorffer@xilinx.com>
List-Id: devicetree@vger.kernel.org

These patches modify drivers/of, sparc, and x86 accordingly to add
OLPC device-tree support.  Updates have been made based upon Grant and
Davem's comments.  They've been compile-tested on sparc64 and x86, and
runtime tested on OLPC machines.

Dave's 25edd6946 commit caused some conflicts w/ patch #2;
hopefully I mangled it properly.
