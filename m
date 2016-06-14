From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v4 0/1] pstore/ram: add Device Tree bindings
Date: Tue, 14 Jun 2016 16:59:15 -0500
Message-ID: <20160614215914.GA16454@rob-hp-laptop>
References: <1465599059-22665-1-git-send-email-keescook@chromium.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-doc-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1465599059-22665-1-git-send-email-keescook@chromium.org>
Sender: linux-doc-owner@vger.kernel.org
To: Kees Cook <keescook@chromium.org>
Cc: linux-kernel@vger.kernel.org, Greg Hackmann <ghackmann@google.com>, Arnd Bergmann <arnd@arndb.de>, Markus Pargmann <mpa@pengutronix.de>, Olof Johansson <olof@lixom.net>, Brian Norris <computersforpeace@gmail.com>, Anton Vorontsov <anton@enomsg.org>, Colin Cross <ccross@android.com>, Lee Campbell <leecam@google.com>, Tony Luck <tony.luck@intel.com>, devicetree@vger.kernel.org, linux-doc@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Fri, Jun 10, 2016 at 03:50:58PM -0700, Kees Cook wrote:
> This is a "v4" of Greg Hackmann's DT bindings for ramoops. This is
> what I'm going to land in the pstore tree unless there are strong and
> convincing arguments against it. :)
> 
> I made a number of changes based people's feedback, and I want to get
> it unblocked. This patch is already carried by Android, and it doesn't
> need to be out of tree.
> 
> To respond to Arnd's comment: I like this as the ramoops node, not the
> pstore node, since it describes the ramoops backend, not the pstore
> subsystem, which has different controls, and can only have one backend
> at a time. So it doesn't make sense to me to have this have a redundant
> extra pstore node, since the very presence of ramoops implies pstore.

Either I don't follow or you don't get Arnd's comment...

IIRC, his suggestion which I agree with was to remove the memory-region 
phandle and just move all the properties into the reserved memory node 
directly. This simplifies things such that we are just describing 
properties of a chunk of memory rather than a Linux specific node for 
virtual driver.

Rob
