From: Andrew Lunn <andrew@lunn.ch>
Subject: Re: [PATCH v3 0/2] of_net: Implement of_get_nvmem_mac_address helper
Date: Wed, 28 Mar 2018 00:43:48 +0200
Message-ID: <20180327224348.GA23320@lunn.ch>
References: <1521815074-30424-1-git-send-email-mike.looijmans@topic.nl>
 <20180323151101.GB24361@lunn.ch>
 <1522046489-19652-1-git-send-email-mike.looijmans@topic.nl>
 <1522144346-32367-1-git-send-email-mike.looijmans@topic.nl>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1522144346-32367-1-git-send-email-mike.looijmans@topic.nl>
Sender: linux-kernel-owner@vger.kernel.org
To: Mike Looijmans <mike.looijmans@topic.nl>
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, f.fainelli@gmail.com, robh+dt@kernel.org, frowand.list@gmail.com
List-Id: devicetree@vger.kernel.org

On Tue, Mar 27, 2018 at 11:52:24AM +0200, Mike Looijmans wrote:
> Posted this as a small set now, with an (optional) second patch that shows
> how the changes work and what I've used to test the code on a Topic Miami board.
> 
> v3: Add patch that implements mac in nvmem for the Cadence MACB controller
>     Remove the integrated of_get_mac_address call
> 
> v2: Use of_nvmem_cell_get to avoid needing the assiciated device
>     Use void* instead of char*
>     Add devicetree binding doc

Hi Mike

This looks good now, thanks.

Reviewed-by: Andrew Lunn <andrew@lunn.ch>

    Andrew
