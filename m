From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH 2/6] docs: writing-schema.md: convert from markdown to
 ReST
Date: Wed, 31 Jul 2019 14:45:00 -0600
Message-ID: <20190731204500.GA6131@bogus>
References: <cover.1564603513.git.mchehab+samsung@kernel.org>
 <a239cd93ad86579ce7e02bc3032abd33b476e193.1564603513.git.mchehab+samsung@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <a239cd93ad86579ce7e02bc3032abd33b476e193.1564603513.git.mchehab+samsung@kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Mauro Carvalho Chehab <mchehab+samsung@kernel.org>
Cc: Linux Doc Mailing List <linux-doc@vger.kernel.org>, Mauro Carvalho Chehab <mchehab@infradead.org>, linux-kernel@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>, Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Wed, Jul 31, 2019 at 05:08:49PM -0300, Mauro Carvalho Chehab wrote:
> The documentation standard is ReST and not markdown.
> 
> Signed-off-by: Mauro Carvalho Chehab <mchehab+samsung@kernel.org>
> Acked-by: Rob Herring <robh@kernel.org>
> ---
>  Documentation/devicetree/writing-schema.md  | 130 -----------------
>  Documentation/devicetree/writing-schema.rst | 153 ++++++++++++++++++++
>  2 files changed, 153 insertions(+), 130 deletions(-)
>  delete mode 100644 Documentation/devicetree/writing-schema.md
>  create mode 100644 Documentation/devicetree/writing-schema.rst

Applied, thanks.

Rob
