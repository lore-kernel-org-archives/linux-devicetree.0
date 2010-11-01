From: Timur Tabi <timur@freescale.com>
Subject: Re: [PATCH] OF device tree: Move of_get_mac_address() to a common
 source file.
Date: Mon, 1 Nov 2010 10:46:03 -0500
Message-ID: <AANLkTimp-AFN5T3z9o6X9qM-GQXSU5vinf+Lqu_jUmJj@mail.gmail.com>
References: <1288130833-16421-1-git-send-email-ddaney@caviumnetworks.com> <20101101051734.GB17587@angua.secretlab.ca>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <netdev-owner@vger.kernel.org>
In-Reply-To: <20101101051734.GB17587@angua.secretlab.ca>
Sender: netdev-owner@vger.kernel.org
To: Grant Likely <grant.likely@secretlab.ca>
Cc: devicetree-discuss@lists.ozlabs.org, netdev@vger.kernel.org, linuxppc-dev@lists.ozlabs.org
List-Id: devicetree@vger.kernel.org

On Mon, Nov 1, 2010 at 12:17 AM, Grant Likely <grant.likely@secretlab.ca> wrote:

> Applied, thanks; but made some changes to protect this code because it
> does not work on little endian (it can be fixed in a separate patch)

I'm confused.  How does of_get_mac_address() not work on little-endian?

-- 
Timur Tabi
Linux kernel developer at Freescale
