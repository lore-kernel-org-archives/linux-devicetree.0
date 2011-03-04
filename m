From: Grant Likely <grant.likely@secretlab.ca>
Subject: Re: [RFC PATCH v2 03/12] of: Make of_find_node_by_path() traverse
 /aliases for relative paths.
Date: Fri, 4 Mar 2011 14:55:24 -0700
Message-ID: <20110304215524.GB7579@angua.secretlab.ca>
References: <1299267744-17278-1-git-send-email-ddaney@caviumnetworks.com>
 <1299267744-17278-4-git-send-email-ddaney@caviumnetworks.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1299267744-17278-4-git-send-email-ddaney@caviumnetworks.com>
Sender: linux-kernel-owner@vger.kernel.org
To: David Daney <ddaney@caviumnetworks.com>
Cc: linux-mips@linux-mips.org, ralf@linux-mips.org, devicetree-discuss@lists.ozlabs.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Fri, Mar 04, 2011 at 11:42:15AM -0800, David Daney wrote:
> Currently all paths passed to of_find_node_by_path() must begin with a
> '/', indicating a full path to the desired node.
> 
> Augment the look-up code so that if a path does *not* begin with '/',
> the path is used as the name of an /aliases property.  The value of
> this alias is then used as the full node path to be found.
> 
> Signed-off-by: David Daney <ddaney@caviumnetworks.com>
> ---
> 
> This patch is unchanged from the previous version I send separately.  I
> have not forgotten about Grant's feedback, just deferred it to the
> next version.

okay; I'll wait for the next version before I consider picking it up.

g.
