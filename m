From: Paolo Pisati <p.pisati@gmail.com>
Subject: Re: [PATCH v3 2/2] fpga: lattice machxo2: Add Lattice MachXO2 support
Date: Fri, 16 Jun 2017 11:04:36 +0200
Message-ID: <20170616090436.GA5037@harukaze>
References: <1497525185-30232-1-git-send-email-p.pisati@gmail.com>
 <1497525185-30232-3-git-send-email-p.pisati@gmail.com>
 <CAAtXAHfv75VC=J+J5Xd7xeAoPtu1k97XRp2FSOS0ttwnrvWurg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CAAtXAHfv75VC=J+J5Xd7xeAoPtu1k97XRp2FSOS0ttwnrvWurg@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Moritz Fischer <moritz.fischer@ettus.com>
Cc: Paolo Pisati <p.pisati@gmail.com>, Alan Tull <atull@kernel.org>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, linux-fpga@vger.kernel.org, Devicetree List <devicetree@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Thu, Jun 15, 2017 at 01:03:41PM -0700, Moritz Fischer wrote:
> > +static int machxo2_write(struct fpga_manager *mgr, const char *buf,
> > +                        size_t count)
> > +{
> > +       struct spi_device *spi = mgr->priv;
> > +       struct spi_message msg;
> > +       struct spi_transfer tx;
> > +       u32 progincr = LSC_PROGINCRNV;
> > +       u8 payload[MACHXO2_BUF_SIZE];
> > +       int i, ret;
> > +
> > +       if (count % MACHXO2_PAGE_SIZE != 0) {
> > +               dev_err(&mgr->dev, "Malformed payload.\n");
> > +               return -EINVAL;
> > +       }
> > +
> > +       memcpy(payload, &progincr, MACHXO2_OP_SIZE);
> > +       for (i = 0; i < count; i += MACHXO2_PAGE_SIZE) {
> > +               memcpy(&payload[MACHXO2_OP_SIZE], &buf[i], MACHXO2_PAGE_SIZE);
> > +               memset(&tx, 0, sizeof(tx));
> > +               spi_message_init(&msg);
> > +               tx.tx_buf = payload;
> > +               tx.len = MACHXO2_BUF_SIZE;
> > +               tx.delay_usecs = MACHXO2_HIGH_DELAY;
> > +               spi_message_add_tail(&tx, &msg);
> > +               ret = spi_sync(spi, &msg);
> > +               if (ret) {
> > +                       dev_err(&mgr->dev, "Error loading the bitstream.\n");
> > +                       return ret;
> > +               }
> > +       }
> 
> Can't you chain them together and submit it as one? Instead of calling
> spi_sync in a loop?
> You don't seem to wait for _wait_until_not_busy, so wouldn't that work?

I could unroll the loop, or i could move from a static delay
(MACHXO2_HIGH_DELAY) to checking the busy flag if we want to make it faster, not
sure which one i prefer, or if it's worth though.
-- 
bye,
p.
