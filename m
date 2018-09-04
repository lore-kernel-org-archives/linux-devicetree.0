From: Johan Hovold <johan@kernel.org>
Subject: Re: [PATCH v2 4/9] mmc: meson-mx-sdio: fix OF child-node lookup
Date: Tue, 4 Sep 2018 14:54:02 +0200
Message-ID: <20180904125402.GR28861@localhost>
References: <20180827082153.22537-1-johan@kernel.org>
 <20180827082153.22537-5-johan@kernel.org>
 <CAPDyKFot-Nx=R83vxS=WQp2kSFmMiQ7wfOK4m6hbPt0MB3Z25A@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <stable-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CAPDyKFot-Nx=R83vxS=WQp2kSFmMiQ7wfOK4m6hbPt0MB3Z25A@mail.gmail.com>
Sender: stable-owner@vger.kernel.org
To: Ulf Hansson <ulf.hansson@linaro.org>
Cc: Johan Hovold <johan@kernel.org>, Rob Herring <robh+dt@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Frank Rowand <frowand.list@gmail.com>, DTML <devicetree@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, stable <stable@vger.kernel.org>, Carlo Caione <carlo@endlessm.com>, Martin Blumenstingl <martin.blumenstingl@googlemail.com>
List-Id: devicetree@vger.kernel.org

On Mon, Aug 27, 2018 at 04:44:44PM +0200, Ulf Hansson wrote:
> On 27 August 2018 at 10:21, Johan Hovold <johan@kernel.org> wrote:
> > Use the new of_get_compatible_child() helper to lookup the slot child
> > node instead of using of_find_compatible_node(), which searches the
> > entire tree from a given start node and thus can return an unrelated
> > (i.e. non-child) node.
> >
> > This also addresses a potential use-after-free (e.g. after probe
> > deferral) as the tree-wide helper drops a reference to its first
> > argument (i.e. the node of the device being probed).
> >
> > While at it, also fix up the related slot-node reference leak.
> >
> > Fixes: ed80a13bb4c4 ("mmc: meson-mx-sdio: Add a driver for the Amlogic Meson8 and Meson8b SoCs")
> > Cc: stable <stable@vger.kernel.org>     # 4.15
> > Cc: Carlo Caione <carlo@endlessm.com>
> > Cc: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
> > Cc: Ulf Hansson <ulf.hansson@linaro.org>
> > Acked-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
> > Signed-off-by: Johan Hovold <johan@kernel.org>
> 
> Acked-by: Ulf Hansson <ulf.hansson@linaro.org>

Thanks for the ack. Rob's gotten the helper into -rc2, so feel free to
pick this one up directly to whichever mmc branch you prefer. I've been
able to trigger crashes after probe deferrals due to the use-after-free,
but this seems unlikely to be exploitable.

Thanks,
Johan
