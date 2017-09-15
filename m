From: Greg KH <gregkh@linuxfoundation.org>
Subject: Re: [PATCH 1/5] usb: usb251xb: Add USB2517/i hub support
Date: Fri, 15 Sep 2017 16:45:14 -0700
Message-ID: <20170915234514.GA8407@kroah.com>
References: <20170915233113.17855-1-fancer.lancer@gmail.com>
 <20170915233113.17855-2-fancer.lancer@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20170915233113.17855-2-fancer.lancer@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Serge Semin <fancer.lancer@gmail.com>
Cc: richard.leitner@skidata.com, robh+dt@kernel.org, mark.rutland@arm.com, Sergey.Semin@t-platforms.ru, linux-usb@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Sat, Sep 16, 2017 at 02:31:09AM +0300, Serge Semin wrote:
> USB2517i hubs are very like USB251xb devices series. They have almost
> the same configuration registers space except number of ports, led
> configurations and lack of battery settings. All these peculiarities
> are reflected in this patch.

Please add one type of feature at a time per patch.  That makes it
easier to review and ensure you got it right.

thanks,

greg k-h
