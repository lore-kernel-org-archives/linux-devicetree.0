From: Jason Gunthorpe <jgunthorpe@obsidianresearch.com>
Subject: Re: [PATCH v4 3/5] tee: generic TEE subsystem
Date: Thu, 9 Jul 2015 12:25:25 -0600
Message-ID: <20150709182525.GA27758@obsidianresearch.com>
References: <1436350592-7732-1-git-send-email-jens.wiklander@linaro.org>
 <1436350592-7732-4-git-send-email-jens.wiklander@linaro.org>
 <20150708171026.GA11740@obsidianresearch.com>
 <20150709124908.GA27483@ermac>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20150709124908.GA27483@ermac>
Sender: linux-kernel-owner@vger.kernel.org
To: Jens Wiklander <jens.wiklander@linaro.org>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Rob Herring <robh+dt@kernel.org>, Herbert Xu <herbert@gondor.apana.org.au>, valentin.manea@huawei.com, jean-michel.delorme@st.com, emmanuel.michel@st.com, javier@javigon.com, Mark Rutland <mark.rutland@arm.com>, Michal Simek <michal.simek@xilinx.com>
List-Id: devicetree@vger.kernel.org

On Thu, Jul 09, 2015 at 02:49:08PM +0200, Jens Wiklander wrote:
> > Generally in a scheme like this we'd see open and release get/put the
> > underlying module handle to prevent driver removal while the char dev
> > is open. Otherwise module removal will hang here.
> 
> I'm perhaps misunderstanding you. While the cdev has any open file
> descriptors rmmod will fail with "Resource temporarily unavailable"
> because of fops_get() in chrdev_open().

Hmm, I see, you've done this:

+       cdev_init(&teedev->cdev, &tee_fops);
+       teedev->cdev.owner = teedesc->owner;

And owner here is the driver module? Interesting.. Looks OK..

Jason
