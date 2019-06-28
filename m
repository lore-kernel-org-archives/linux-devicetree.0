From: Rob Herring <robh+dt@kernel.org>
Subject: Re: [PATCH 1/5] docs: convert markdown documents to ReST
Date: Fri, 28 Jun 2019 16:38:23 -0600
Message-ID: <CAL_JsqJNUNbNbB085y6O1ZYpS6pKSOS+3YNWZ-au0O7SN0Uu1w@mail.gmail.com>
References: <cover.1561756511.git.mchehab+samsung@kernel.org> <7a5734d147788ffb817c8122dbb0ff619a718a71.1561756511.git.mchehab+samsung@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <7a5734d147788ffb817c8122dbb0ff619a718a71.1561756511.git.mchehab+samsung@kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Mauro Carvalho Chehab <mchehab+samsung@kernel.org>
Cc: Linux Doc Mailing List <linux-doc@vger.kernel.org>, Mauro Carvalho Chehab <mchehab@infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Jonathan Corbet <corbet@lwn.net>, Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Fri, Jun 28, 2019 at 3:23 PM Mauro Carvalho Chehab
<mchehab+samsung@kernel.org> wrote:
>
> The documentation standard is ReST and not markdown.
>
> Signed-off-by: Mauro Carvalho Chehab <mchehab+samsung@kernel.org>
> ---
>  Documentation/devicetree/writing-schema.md    | 130 ---------------
>  Documentation/devicetree/writing-schema.rst   | 153 ++++++++++++++++++

I wasn't really ever intending to integrate this into the rest of the
kernel docs, but I'm not tied to any format so:

Acked-by: Rob Herring <robh@kernel.org>

>  ...entication.md => ubifs-authentication.rst} |  70 +++++---
>  3 files changed, 197 insertions(+), 156 deletions(-)
>  delete mode 100644 Documentation/devicetree/writing-schema.md
>  create mode 100644 Documentation/devicetree/writing-schema.rst
>  rename Documentation/filesystems/{ubifs-authentication.md => ubifs-authentication.rst} (95%)
