From: Sam Ravnborg <sam@ravnborg.org>
Subject: Re: [PATCH 0/3] dt: documentation reorganization
Date: Mon, 31 Jan 2011 21:34:49 +0100
Message-ID: <20110131203449.GA4199@merkur.ravnborg.org>
References: <20110131073918.9058.37628.stgit@localhost6.localdomain6>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20110131073918.9058.37628.stgit@localhost6.localdomain6>
Sender: linux-kernel-owner@vger.kernel.org
To: Grant Likely <grant.likely@secretlab.ca>
Cc: devicetree-discuss@lists.ozlabs.org, linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org, jwboyer@linux.vnet.ibm.com, benh@kernel.crashing.org
List-Id: devicetree@vger.kernel.org

On Mon, Jan 31, 2011 at 12:44:41AM -0700, Grant Likely wrote:
> This series reorganizes and cleans up the device tree documentation
> to make the directory useful for non-powerpc users.

Looks better than first try. But the structure is very flat.
Did you consider an arch/* for all arch specific stuff?

	Sam
