From: Grant Likely <grant.likely@secretlab.ca>
Subject: Re: [RFC] (early draft) dt: Linux dt usage model documentation
Date: Tue, 14 Jun 2011 11:47:40 -0600
Message-ID: <BANLkTinp19mk0Hjwuw0ewGOnbL9VQjfisw@mail.gmail.com>
References: <20110613132935.16600.94753.stgit@ponder> <20110614031033.GA4996@yookeroo.fritz.box>
 <BANLkTim_Vzx2ojk33YX+Y6dC-FXsGhm9zw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-doc-owner@vger.kernel.org>
In-Reply-To: <BANLkTim_Vzx2ojk33YX+Y6dC-FXsGhm9zw@mail.gmail.com>
Sender: linux-doc-owner@vger.kernel.org
To: FarMcKon@buglabs.net
Cc: devicetree-discuss@lists.ozlabs.org, Randy Dunlap <rdunlap@xenotime.net>, linaro-dev@lists.linaro.org, linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Tue, Jun 14, 2011 at 8:05 AM, Far McKon <far.mckon@buglabs.net> wrote:
> Grant,
> I don't see any system for indicating an expandable bus or a pulg in
> module so far? Am I missing something, or does this protocol/layout
> not allow for plug in or expansion modules?

The DT as we're using it now primarily captures the static structure
of the system.  Typically this means anything directly on-board, or
unlikely to ever be hot-plugged (like a CPU module on a carrier
board).  The DT is expressive enough to capture the details of plugged
in modules, but in general if the device can be detected and
identified reliably by the hardware (like USB and PCI devices), then
there is no real need to describe it in the DT.

With 'real' OpenFirmware, the firmware did indeed enumerate hot
plugged devices in the DT, but we don't do that at all for the
firmware using the flattened tree.

That said, you may have a need to describe the internal details of a
plug in module, and you could do that with DT.  XIlinx has done some
work that allows a partial DT to be passed in at runtime to describe
the behaviour of an FPGA module after it has been programmed with a
bitstream.

g.
