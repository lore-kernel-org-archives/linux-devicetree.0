From: David Collins <collinsd@codeaurora.org>
Subject: How to represent negative values for device tree property
Date: Fri, 29 Mar 2013 13:13:29 -0700
Message-ID: <5155F5E9.4080106@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-arm-msm-owner@vger.kernel.org>
Sender: linux-arm-msm-owner@vger.kernel.org
To: devicetree-discuss@lists.ozlabs.org
Cc: linux-arm-msm@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Hi,

I am working on a thermal driver which needs to be able to read a
temperature threshold from a device tree property.  The hardware suppor=
ts
thresholds in the range -204.8 to +204.7 C in 0.1 C steps.  I have foun=
d,
as I am sure others have as well, that dtc treats a '-' before an integ=
er
in a dtsi file as a syntax error.  Therefore, I need some artificial wa=
y
to represent negative numbers in device tree.  Here are the possibiliti=
es
that I have thought of so far:

1. Use a second integer to specify the sign of the threshold:
     20000 mC --> <0 20000>
    -20000 mC --> <1 20000>
2. Use a string instead of an integer to specify the threshold and
   then convert it to an integer in the driver software:
     20000 mC --> "20000"
    -20000 mC --> "-20000"
3. Use units of millikelvin instead of millicelcius.  0 mC =3D=3D 27315=
0 mK
     20000 mC --> <293150>
    -20000 mC --> <253150>
4. Use an arbitrary offset e.g. 0 mC =3D=3D 1000000
     20000 mC --> <1020000>
    -20000 mC --> <980000>
5. Use the unsigned 32-bit representation for 2=92s-compliment
   signed 32-bit integer
     20000 mC --> <20000>
    -20000 mC --> <0xffffb1e0> or <4294947296>

Which of these options would you recommend using?  Is there any better =
way
to handle negative values that I haven=92t listed?  What is the best ge=
neral
case solution for specifying negative numbers in device tree?

Thanks,
David

--=20
The Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
hosted by The Linux Foundation
