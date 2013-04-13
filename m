From: Grant Likely <grant.likely@secretlab.ca>
Subject: Re: [PATCH RFC v6] [media] Add common video interfaces OF bindings documentation
Date: Sat, 13 Apr 2013 20:17:52 +0100
Message-ID: <20130413191752.AF4B23E2249@localhost>
References: <1359652738-1544-2-git-send-email-s.nawrocki@samsung.com> <1359657675-6678-1-git-send-email-s.nawrocki@samsung.com> <5149E1A9.9090506@samsung.com>
Return-path: <linux-media-owner@vger.kernel.org>
In-Reply-To: <5149E1A9.9090506@samsung.com>
Sender: linux-media-owner@vger.kernel.org
To: Sylwester Nawrocki <s.nawrocki@samsung.com>, rob.herring@calxeda.com
Cc: g.liakhovetski@gmx.de, linux-media@vger.kernel.org, hverkuil@xs4all.nl, laurent.pinchart@ideasonboard.com, kyungmin.park@samsung.com, swarren@wwwdotorg.org, t.figa@samsung.com, myungjoo.ham@samsung.com, sw0312.kim@samsung.com, prabhakar.lad@ti.com, Thomas Abraham <thomas.abraham@linaro.org>, devicetree-discuss <devicetree-discuss@lists.ozlabs.org>
List-Id: devicetree@vger.kernel.org

On Wed, 20 Mar 2013 17:19:53 +0100, Sylwester Nawrocki <s.nawrocki@samsung.com> wrote:
> On 01/31/2013 07:41 PM, Sylwester Nawrocki wrote:
> > From: Guennadi Liakhovetski <g.liakhovetski@gmx.de>
> > 
> > This patch adds a document describing common OF bindings for video
> > capture, output and video processing devices. It is curently mainly
> > focused on video capture devices, with data busses defined by
> > standards like ITU-R BT.656 or MIPI-CSI2.
> > It also documents a method of describing data links between devices.
> > 
> > Signed-off-by: Guennadi Liakhovetski <g.liakhovetski@gmx.de>
> > Signed-off-by: Sylwester Nawrocki <s.nawrocki@samsung.com>
> > ---
> > 
> > Changes since v5:
> >  - added 'ports' node documentation
> 
> Hi Rob, Grant,
> 
> there was no more comments on this patch for a relatively long time
> now. Would you apply it to your tree or could I send it for inclusion
> in the media tree with your Ack ?

For the binding:

Acked-by: Grant Likely <grant.likely@secretlab.ca>
