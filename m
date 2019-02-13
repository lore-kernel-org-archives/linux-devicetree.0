From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v1 1/1] of: unittest: unflatten device tree on UML when
 testing
Date: Wed, 13 Feb 2019 13:12:02 -0600
Message-ID: <20190213191202.GA3022@bogus>
References: <20190212185305.112847-1-brendanhiggins@google.com>
 <20190212185305.112847-2-brendanhiggins@google.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190212185305.112847-2-brendanhiggins@google.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Brendan Higgins <brendanhiggins@google.com>
Cc: frowand.list@gmail.com, mcgrof@kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Tue, Feb 12, 2019 at 10:53:05AM -0800, Brendan Higgins wrote:
> UML supports enabling OF, and is useful for running the device tree
> tests, so add support for unflattening device tree blobs so we can
> actually use it.
> 
> Signed-off-by: Brendan Higgins <brendanhiggins@google.com>
> ---

For a single patch, no need for a cover letter. Just add any commentary 
here.

>  drivers/of/unittest.c | 3 +++
>  1 file changed, 3 insertions(+)

Applied, thanks.

Rob
