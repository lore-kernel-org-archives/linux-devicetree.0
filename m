From: Greg KH <gregkh@linuxfoundation.org>
Subject: Re: [PATCH] usb: fix typos in code comments
Date: Tue, 21 May 2019 08:29:11 +0200
Message-ID: <20190521062911.GA5791@kroah.com>
References: <20190519035542.22094-1-houweitaoo@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190519035542.22094-1-houweitaoo@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Weitao Hou <houweitaoo@gmail.com>
Cc: robh+dt@kernel.org, mark.rutland@arm.com, linux-usb@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Sun, May 19, 2019 at 11:55:42AM +0800, Weitao Hou wrote:
> fix lenght to length
> 
> Signed-off-by: Weitao Hou <houweitaoo@gmail.com>
> ---
>  Documentation/devicetree/bindings/usb/s3c2410-usb.txt | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

You sent 2 different patches that do different things, yet have
identical subject lines :(

Please fix that up and resend these as a patch series, with unique
subjects.

thanks,

greg k-h
