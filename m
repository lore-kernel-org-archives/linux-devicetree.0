MIME-Version: 1.0
Date: Mon, 22 Jul 2019 09:11:44 -0600
References: <cover.1563792333.git.mchehab+samsung@kernel.org>
	<40b78fbbe64108601c274d28b7c515b3cd29d206.1563792334.git.mchehab+samsung@kernel.org>
In-Reply-To: <40b78fbbe64108601c274d28b7c515b3cd29d206.1563792334.git.mchehab+samsung@kernel.org>
Message-ID: <CAL_JsqJT-moVXuwEndGfJZknHk8p+Vdv+k5hObhT1+x5TZKAPg@mail.gmail.com>
Subject: Re: [PATCH 01/22] docs: convert markdown documents to ReST
From: Rob Herring <robh+dt@kernel.org>
Content-Type: text/plain; charset="UTF-8"
To: Mauro Carvalho Chehab <mchehab+samsung@kernel.org>
Cc: Mark Rutland <mark.rutland@arm.com>, Jonathan Corbet <corbet@lwn.net>, devicetree@vger.kernel.org, Linux Doc Mailing List <linux-doc@vger.kernel.org>
List-ID: <devicetree@vger.kernel.org>

On Mon, Jul 22, 2019 at 5:08 AM Mauro Carvalho Chehab
<mchehab+samsung@kernel.org> wrote:
>
> The documentation standard is ReST and not markdown.
>
> Signed-off-by: Mauro Carvalho Chehab <mchehab+samsung@kernel.org>
> Acked-by: Rob Herring <robh@kernel.org>
> ---
>  Documentation/devicetree/writing-schema.md    | 130 ---------------
>  Documentation/devicetree/writing-schema.rst   | 153 ++++++++++++++++++

Thinking about this some more, can you split this to a separate patch
for me to apply. I may have some changes to this file this cycle.

>  ...entication.md => ubifs-authentication.rst} |  70 +++++---
>  3 files changed, 197 insertions(+), 156 deletions(-)
>  delete mode 100644 Documentation/devicetree/writing-schema.md
>  create mode 100644 Documentation/devicetree/writing-schema.rst
>  rename Documentation/filesystems/{ubifs-authentication.md => ubifs-authentication.rst} (95%)
