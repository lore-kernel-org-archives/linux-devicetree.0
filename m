From: Ralf Baechle <ralf@linux-mips.org>
Subject: Re: [RFC PATCH 02/10] MIPS: Octeon: Add device tree source files.
Date: Wed, 23 Feb 2011 15:30:28 +0100
Message-ID: <20110223143028.GA11832@linux-mips.org>
References: <1298408274-20856-1-git-send-email-ddaney@caviumnetworks.com>
 <1298408274-20856-3-git-send-email-ddaney@caviumnetworks.com>
 <20110223000759.GA26300@yookeroo>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-mips-bounce@linux-mips.org>
Content-Disposition: inline
In-Reply-To: <20110223000759.GA26300@yookeroo>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
To: David Gibson <david@gibson.dropbear.id.au>, David Daney <ddaney@caviumnetworks.com>, linux-mips@linux-mips.org, devicetree-discuss@lists.ozlabs.org, grant.lik
List-Id: devicetree@vger.kernel.org

On Wed, Feb 23, 2011 at 11:07:59AM +1100, David Gibson wrote:

> Uh.. where are the CPUs?

CPUs are probed the old style way on MIPS.  There is a large number of
varieties of CPUs - things like cache size, cache line size, architectural
extension and many small details of behaviour differ.  If we'd fully
honor DT CPU configuration information a kernel would need to have fairly
full blown generic CPU support for anything under the sun.  But there
already is a scheme that allows platform support code to select permanet
enablement, disablement or runtime probe for every CPU feature under the
sun for significant code savings and performance gain.

  Ralf
