From: Anton Vorontsov <anton@enomsg.org>
Subject: Re: [patch] ab8500-charger: we print an unintended error message
Date: Tue, 27 Aug 2013 18:13:42 -0700
Message-ID: <20130828011342.GB10506@lizard>
References: <20130827011942.GD17061@elgon.mountain>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Return-path: <kernel-janitors-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20130827011942.GD17061@elgon.mountain>
Sender: kernel-janitors-owner@vger.kernel.org
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: David Woodhouse <dwmw2@infradead.org>, Grant Likely <grant.likely@linaro.org>, Rob Herring <rob.herring@calxeda.com>, devicetree@vger.kernel.org, kernel-janitors@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Tue, Aug 27, 2013 at 04:19:42AM +0300, Dan Carpenter wrote:
> There is a missing break statement here, so we print an error message
> that the USB type is invalid.  The original code still works fine
> though except for the error message.
> 
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Applied, thanks a lot!

Anton
