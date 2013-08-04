Return-Path: <dmitry.torokhov@gmail.com>
Return-Path: <dmitry.torokhov@gmail.com>
Date: Sat, 3 Aug 2013 17:30:38 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Subject: Re: [PATCH v6] Input: sysrq - DT binding for key sequence
Message-ID: <20130804003038.GA7769@core.coreip.homeip.net>
References: <1375115638-21236-1-git-send-email-mathieu.poirier@linaro.org>
 <CACxGe6u9-sEzxdDzc8T2HFNMqh-LHbTepUHqDF_tLLjxSxSG4Q@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CACxGe6u9-sEzxdDzc8T2HFNMqh-LHbTepUHqDF_tLLjxSxSG4Q@mail.gmail.com>
To: Grant Likely <grant.likely@linaro.org>
Cc: Mathieu Poirier <mathieu.poirier@linaro.org>, Rob Herring <robherring2@gmail.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, John Stultz <john.stultz@linaro.org>, "linux-input@vger.kernel.org" <linux-input@vger.kernel.org>, kernel-team@android.com
List-ID: <devicetree@vger.kernel.org>

On Mon, Jul 29, 2013 at 10:09:54PM -0600, Grant Likely wrote:
> On Mon, Jul 29, 2013 at 10:33 AM,  <mathieu.poirier@linaro.org> wrote:
> > From: "Mathieu J. Poirier" <mathieu.poirier@linaro.org>
> >
> > Adding a simple device tree binding for the specification of key sequences.
> > Definition of the keys found in the sequence are located in
> > 'include/uapi/linux/input.h'.
> >
> > For the sysrq driver, holding the sequence of keys down for a specific amount of time
> > will reset the system.
> >
> > Signed-off-by: Mathieu Poirier <mathieu.poirier@linaro.org>
> 
> Acked-by: Grant Likely <grant.likely@linaro.org>

Applied, thank you.

-- 
Dmitry
