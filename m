From: Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: Re: [RFC PATCH] of: Add a GitLab CI config file for unittests
Date: Fri, 30 Nov 2018 21:52:52 +0100
Message-ID: <CAKMK7uGrBnaip1E+vp6foGfvdRb2=bhPNOmmZfjTUt2HZPLQcA@mail.gmail.com>
References: <20181130203232.5743-1-robh@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20181130203232.5743-1-robh@kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh@kernel.org>, dri-devel <dri-devel@lists.freedesktop.org>
Cc: devicetree@vger.kernel.org, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Frank Rowand <frowand.list@gmail.com>
List-Id: devicetree@vger.kernel.org

On Fri, Nov 30, 2018 at 9:32 PM Rob Herring <robh@kernel.org> wrote:
>
> This adds a GitLab CI config file running the DT unittest in a usermode
> Linux build. The corresponding CI job can be found here:
>
> https://gitlab.com/robherring/linux-dt-unittest/pipelines
>
> This CI job can be duplicated by others by creating a kernel repo on a
> GitLab instance and configuring GitLab CI to use
> drivers/of/.gitlab-ci.yml config file.
>
> Cc: Frank Rowand <frowand.list@gmail.com>
> Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
> Signed-off-by: Rob Herring <robh@kernel.org>

Adding dri-devel.

> ---
>  drivers/of/.gitlab-ci.yml | 18 ++++++++++++++++++
>  1 file changed, 18 insertions(+)
>  create mode 100644 drivers/of/.gitlab-ci.yml
>
> diff --git a/drivers/of/.gitlab-ci.yml b/drivers/of/.gitlab-ci.yml
> new file mode 100644
> index 000000000000..44a4824f5c33
> --- /dev/null
> +++ b/drivers/of/.gitlab-ci.yml
> @@ -0,0 +1,18 @@
> +# SPDX-License-Identifier: GPL-2.0+
> +
> +image: registry.gitlab.com/robherring/docker-images/ubuntu-kernel-build

I think it's better to include the docker recipe too. One because
shipping pre-built dockers is a license nightmare, second because
better hackability. For a full on example see:

https://gitlab.freedesktop.org/drm/igt-gpu-tools/blob/master/.gitlab-ci.yml

For the kernel I guess the question is where we should put all the
docker files. There's going to be some need for subsystem specific
tooling (e.g. we want something that has igt installed eventually for
anything drm), so maybe just keeping them in subsystem directories is
best. Was at least my plan with drivers/gpu.

Needs latest gitlab to make the build-on-demand stuff work, but
gitlab.com has that.
-Daniel
> +
> +variables:
> +  ARCH: um
> +
> +job-unittest:
> +  artifacts:
> +    paths:
> +      - "*.log"
> +
> +  script:
> +    - echo -e "CONFIG_OF=y\nCONFIG_OF_UNITTEST=y\nCONFIG_OF_OVERLAY=y" > kernel/configs/extra.config
> +    - make defconfig extra.config
> +    - make -s -j $(nproc) vmlinux | tee build.log
> +    - TMP=/tmp ./vmlinux > boot.log || true
> +    - grep -E '\#\#\# dt-test \#\#\# end of unittest - [0-9]* passed, 0 failed' boot.log
> --
> 2.19.1
>


-- 
Daniel Vetter
Software Engineer, Intel Corporation
+41 (0) 79 365 57 48 - http://blog.ffwll.ch
