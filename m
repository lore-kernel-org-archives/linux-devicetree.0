From: Benjamin Herrenschmidt <benh@kernel.crashing.org>
Subject: Re: [PATCH 2/2] of: remove /proc/device-tree
Date: Thu, 21 Mar 2013 05:19:54 +0100
Message-ID: <1363839594.17680.19.camel@pasglop>
References: <1363791074-16415-1-git-send-email-grant.likely@secretlab.ca>
	 <1363791074-16415-3-git-send-email-grant.likely@secretlab.ca>
	 <1363791479.12701.9.camel@pasglop>
	 <CACxGe6u2wNbPQSOPRCRO0To5UC-b8rXYanv2xv26hk5oaozvPA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CACxGe6u2wNbPQSOPRCRO0To5UC-b8rXYanv2xv26hk5oaozvPA@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Grant Likely <grant.likely@secretlab.ca>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, devicetree-discuss <devicetree-discuss@lists.ozlabs.org>, Rob Herring <rob.herring@calxeda.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "David S. Miller" <davem@davemloft.net>
List-Id: devicetree@vger.kernel.org

On Wed, 2013-03-20 at 21:38 +0000, Grant Likely wrote:
> > NAK. It should at the very least be a CONFIG option for a while
> before
> > completely switching over.
> 
> I'll modify patch 1 to create the symlink if CONFIG_PROC_DEVICETREE is
> not set. After the first patch can be applied we can leave it for a
> release or two before applying the second.

Shouldn't we have the symlink just be a config option itself ?
Eventually distros might want get rid of it completely ..

Ben.
