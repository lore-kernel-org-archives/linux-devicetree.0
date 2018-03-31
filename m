From: Andrew Lunn <andrew@lunn.ch>
Subject: Re: [PATCH v4 0/2] of_net: Implement of_get_nvmem_mac_address helper
Date: Sat, 31 Mar 2018 19:27:35 +0200
Message-ID: <20180331172735.GC7460@lunn.ch>
References: <1522046489-19652-1-git-send-email-mike.looijmans@topic.nl>
 <1522144346-32367-1-git-send-email-mike.looijmans@topic.nl>
 <1522301389-11034-1-git-send-email-mike.looijmans@topic.nl>
 <20180330.104054.147506012234775496.davem@davemloft.net>
 <56a0d45c-bf2a-0d9a-fa2e-9f6531caa61c@topic.nl>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <netdev-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <56a0d45c-bf2a-0d9a-fa2e-9f6531caa61c@topic.nl>
Sender: netdev-owner@vger.kernel.org
To: Mike Looijmans <mike.looijmans@topic.nl>
Cc: David Miller <davem@davemloft.net>, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, f.fainelli@gmail.com, robh+dt@kernel.org, frowand.list@gmail.com
List-Id: devicetree@vger.kernel.org

On Sat, Mar 31, 2018 at 07:20:30PM +0200, Mike Looijmans wrote:
> On 30-03-18 16:40, David Miller wrote:
> >From: Mike Looijmans <mike.looijmans@topic.nl>
> >Date: Thu, 29 Mar 2018 07:29:47 +0200
> >
> >>Posted this as a small set now, with an (optional) second patch that shows
> >>how the changes work and what I've used to test the code on a Topic Miami board.
> >>I've taken the liberty to add appropriate "Acked" and "Review" tags.
> >>
> >>v4: Replaced "6" with ETH_ALEN
> >>
> >>v3: Add patch that implements mac in nvmem for the Cadence MACB controller
> >>     Remove the integrated of_get_mac_address call
> >>
> >>v2: Use of_nvmem_cell_get to avoid needing the assiciated device
> >>     Use void* instead of char*
> >>     Add devicetree binding doc
> >
> >Series applied to net-next, thank you.
> >
> 
> Got a kbuild bot error message in the e-mail, with errors like: "undefined
> reference to `of_nvmem_cell_get'"
> 
> Should I add an "#if CONFIG_NVMEM" guard around the new code and make a v5
> patch?

Hi Mike

You need to understand what is actually causing the problem. If it no
NVMEM, or no OF? The kernel config was part of the email, so you
should be able to reproduce the failure.

We don't normally add #ifdef in code. Instead we implement stub
functions in the header file, which would in this case return
something like -ENODEV.

Dave has already take this patch. So you need to do an incremental
fix.

	  Andrew
