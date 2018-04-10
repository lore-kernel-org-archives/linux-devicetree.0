From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: Re: [PATCH 2/2] of: add of_node_read()
Date: Tue, 10 Apr 2018 09:11:06 +0200
Message-ID: <20180410071106.GB19397@kroah.com>
References: <87bmerv9ll.wl%kuninori.morimoto.gx@renesas.com>
 <878t9vv9jv.wl%kuninori.morimoto.gx@renesas.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <878t9vv9jv.wl%kuninori.morimoto.gx@renesas.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: Rob Herring <robh+dt@kernel.org>, Frank Rowand <frowand.list@gmail.com>, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Tue, Apr 10, 2018 at 06:54:13AM +0000, Kuninori Morimoto wrote:
> 
> From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
> 
> We are counting of node by using of_node_get/put(), but
> not have of_node_read() which can be used to check count.
> Let's add it

Same objection as previous patch, please no.

thanks,

greg k-h
