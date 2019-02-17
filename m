From: Rob Herring <robh+dt@kernel.org>
Subject: Re: [PATCH v1 2/6] dt-bindings: drm/msm/a6xx: Add GX power-domain for
 GMU bindings
Date: Sun, 17 Feb 2019 15:08:14 -0600
Message-ID: <CAL_JsqJ0FX=dbQb34bvZcdbWibjKnS2VXGsApT_Vz+UcjUxCSQ@mail.gmail.com>
References: <1549296944-17285-1-git-send-email-jcrouse@codeaurora.org> <1549296944-17285-3-git-send-email-jcrouse@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1549296944-17285-3-git-send-email-jcrouse@codeaurora.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Jordan Crouse <jcrouse@codeaurora.org>
Cc: freedreno <freedreno@lists.freedesktop.org>, linux-arm-msm <linux-arm-msm@vger.kernel.org>, devicetree@vger.kernel.org, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, dri-devel <dri-devel@lists.freedesktop.org>, Rob Clark <robdclark@gmail.com>, David Airlie <airlied@linux.ie>, Mark Rutland <mark.rutland@arm.com>, Daniel Vetter <daniel@ffwll.ch>
List-Id: devicetree@vger.kernel.org

On Mon, Feb 4, 2019 at 10:15 AM Jordan Crouse <jcrouse@codeaurora.org> wrote:
>
> The GMU should have two power domains defined: "cx" and "gx". "cx" is the
> actual power domain for the device and "gx" will be attached at runtime
> to manage reference counting on the GPU device in case of a GMU crash.

power-domains are supposed to be actual regions on a chip die which
can be power gated. However, they are often abused by being defined in
terms of kernel PM domains which are not always the same thing. This
description sounds like the latter case.

Rob
