From: David Miller <davem@davemloft.net>
Subject: Re: [PATCH v6 2/2] of: Make of_find_node_by_path() traverse
 /aliases for relative paths.
Date: Wed, 29 Feb 2012 15:36:33 -0500 (EST)
Message-ID: <20120229.153633.249570825230282737.davem@davemloft.net>
References: <1330543264-18103-1-git-send-email-ddaney.cavm@gmail.com>
        <1330543264-18103-3-git-send-email-ddaney.cavm@gmail.com>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-mips-bounce@linux-mips.org>
In-Reply-To: <1330543264-18103-3-git-send-email-ddaney.cavm@gmail.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
To: ddaney.cavm@gmail.com
Cc: linux-mips@linux-mips.org, ralf@linux-mips.org, devicetree-discuss@lists.ozlabs.org, grant.likely@secretlab.ca, rob.herring@calxeda.com, linux-kernel@vger.kernel.org, david.daney@cavium.com
List-Id: devicetree@vger.kernel.org

From: David Daney <ddaney.cavm@gmail.com>
Date: Wed, 29 Feb 2012 11:21:04 -0800

> Currently all paths passed to of_find_node_by_path() must begin with a
> '/', indicating a full path to the desired node.
> 
> Augment the look-up code so that if a path does *not* begin with '/',
> the path is used as the name of an /aliases property.  The value of
> this alias is then used as the full node path to be found.
> 
> Signed-off-by: David Daney <david.daney@cavium.com>

But as the caller you sure as hell know whether you have a "/"
prefixed name or not.

Why complicate an incredibly well designed and simple function for
something you can create another interface for?
