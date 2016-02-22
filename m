From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH 1/1] of/overlay: of overlay callbacks
Date: Sun, 21 Feb 2016 20:55:17 -0600
Message-ID: <20160222025517.GS15973@rob-hp-laptop>
References: <1455730885-1514-1-git-send-email-atull@opensource.altera.com>
 <1455730885-1514-2-git-send-email-atull@opensource.altera.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1455730885-1514-2-git-send-email-atull@opensource.altera.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Alan Tull <atull@opensource.altera.com>
Cc: Pantelis Antoniou <pantelis.antoniou@konsulko.com>, Frank Rowand <frowand.list@gmail.com>, Grant Likely <grant.likely@linaro.org>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Moritz Fischer <moritz.fischer@ettus.com>, Pantelis Antoniou <pantelis.antoniou@gmail.com>, Alan Tull <delicious.quinoa@gmail.com>, Dinh Nguyen <dinguyen@opensource.altera.com>
List-Id: devicetree@vger.kernel.org

On Wed, Feb 17, 2016 at 11:41:25AM -0600, Alan Tull wrote:
> Add overlay callback functionality.
> 
> When DT overlays are being added, some drivers/subsystems
> will want to know about the changes before they go into the
> live tree.  Similarly there is a need for post-remove
> callbacks.
> 
> Each handler is registered with a of_device_id.  When
> an overlay target matches a handler's id, the handler
> gets called.
> 
> The following 4 cases are handled: pre-apply, post-apply,
> pre-remove, and post-remove.

So I know I suggested maybe not using notifiers, but this ends up just 
looking like notifiers, so we might as well use them unless we somehow 
change the flow. You would just need to add pre-apply and pre-remove 
in of_attach_node and of_detach_node, right?

Rob
