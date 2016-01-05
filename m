From: Vinod Koul <vinod.koul@intel.com>
Subject: Re: [PATCH V11 3/7] dma: add Qualcomm Technologies HIDMA management
 driver
Date: Tue, 5 Jan 2016 10:16:19 +0530
Message-ID: <20160105044619.GJ2940@localhost>
References: <1451865996-12808-1-git-send-email-okaya@codeaurora.org>
 <1451865996-12808-4-git-send-email-okaya@codeaurora.org>
 <CAHp75Vd49-1H+1dkDmJzLpVhov1g+uJV+YiTBC9Xd3hVTmwRVg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-arm-msm-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CAHp75Vd49-1H+1dkDmJzLpVhov1g+uJV+YiTBC9Xd3hVTmwRVg@mail.gmail.com>
Sender: linux-arm-msm-owner@vger.kernel.org
To: Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: Sinan Kaya <okaya@codeaurora.org>, dmaengine <dmaengine@vger.kernel.org>, Mark Rutland <mark.rutland@arm.com>, Timur Tabi <timur@codeaurora.org>, devicetree <devicetree@vger.kernel.org>, Christopher Covington <cov@codeaurora.org>, jcm@redhat.com, Andy Gross <agross@codeaurora.org>, Arnd Bergmann <arnd@arndb.de>, linux-arm-msm@vger.kernel.org, linux-arm Mailing List <linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Mon, Jan 04, 2016 at 08:37:30PM +0200, Andy Shevchenko wrote:

> > +static int set_priority(struct hidma_mgmt_dev *mdev, unsigned int i, u64 val)
> > +{
> > +       u64 tmp;
> > +       int rc;
> > +
> > +       if (i > mdev->dma_channels)
> 
> Shouldn't be >= ? I somehow missed that.

There is no merit is posting not related context while replying, makes your
emails harder to read, please fix that

> > +               return -EINVAL;
> > +
> > +       tmp = mdev->priority[i];
> > +       mdev->priority[i] = val;
> > +       rc = hidma_mgmt_setup(mdev);
> > +       if (rc)
> > +               mdev->priority[i] = tmp;
> > +       return rc;
> > +}
> > +
> > +static int set_weight(struct hidma_mgmt_dev *mdev, unsigned int i, u64 val)
> > +{
> > +       u64 tmp;
> > +       int rc;
> > +
> > +       if (i > mdev->dma_channels)
> 
> Ditto.

Exactly, ditto...


-- 
~Vinod
